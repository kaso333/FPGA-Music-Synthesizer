vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Organki is
    Port (
        Clock100MHz : in STD_LOGIC; -- 100 MHz system clock
        Button : in STD_LOGIC_VECTOR (3 downto 0); -- Four input buttons
        SW : in STD_LOGIC_VECTOR (3 downto 0); -- Four switches
        Buzzer : out STD_LOGIC; -- Buzzer output for tone generation
        LED0_R, LED0_G, LED0_B : out STD_LOGIC; -- RGB LED0
        LED1_R, LED1_G, LED1_B : out STD_LOGIC; -- RGB LED1
        LED2_R, LED2_G, LED2_B : out STD_LOGIC; -- RGB LED2
        LED3_R, LED3_G, LED3_B : out STD_LOGIC  -- RGB LED3
    );
end Organki;

architecture Behavioral of Organki is
    -- Clock frequency and note period constants
    constant CLK_FREQ : integer := 100_000_000; -- 100 MHz clock
    constant C4_COUNT : integer := CLK_FREQ / (261 * 2); -- C4: 261 Hz
    constant D4_COUNT : integer := CLK_FREQ / (294 * 2); -- D4: 294 Hz
    constant E4_COUNT : integer := CLK_FREQ / (330 * 2); -- E4: 330 Hz
    constant G4_COUNT : integer := CLK_FREQ / (392 * 2); -- G4: 392 Hz
    constant C5_COUNT : integer := CLK_FREQ / (523 * 2); -- C5: 523 Hz
    constant D5_COUNT : integer := CLK_FREQ / (587 * 2); -- D5: 587 Hz
    constant E5_COUNT : integer := CLK_FREQ / (659 * 2); -- E5: 659 Hz
    constant G5_COUNT : integer := CLK_FREQ / (784 * 2); -- G5: 784 Hz
    
    -- Signals for tone generation
    signal counter : unsigned(19 downto 0) := (others => '0'); -- Counter for clock division
    signal tone_count : integer := C4_COUNT; -- Selected note period
    signal pwm_enable : STD_LOGIC := '0'; -- Enable PWM output when button is pressed

begin
    -- RGB LED control based on button and switch state
    process(Clock100MHz)
    begin
        if rising_edge(Clock100MHz) then
            -- Default: all RGB LEDs off
            LED0_R <= '0'; LED0_G <= '0'; LED0_B <= '0';
            LED1_R <= '0'; LED1_G <= '0'; LED1_B <= '0';
            LED2_R <= '0'; LED2_G <= '0'; LED2_B <= '0';
            LED3_R <= '0'; LED3_G <= '0'; LED3_B <= '0';
            
            -- Set RGB colors based on button and switch state (priority to lower index)
            if Button(0) = '1' then
                if SW(0) = '0' then
                    LED0_G <= '1'; -- Green for SW(0) = '0'
                else
                    LED0_R <= '1'; -- Red for SW(0) = '1'
                end if;
            elsif Button(1) = '1' then
                if SW(1) = '0' then
                    LED1_G <= '1'; -- Green for SW(1) = '0'
                else
                    LED1_R <= '1'; -- Red for SW(1) = '1'
                end if;
            elsif Button(2) = '1' then
                if SW(2) = '0' then
                    LED2_G <= '1'; -- Green for SW(2) = '0'
                else
                    LED2_R <= '1'; -- Red for SW(2) = '1'
                end if;
            elsif Button(3) = '1' then
                if SW(3) = '0' then
                    LED3_G <= '1'; -- Green for SW(3) = '0'
                else
                    LED3_R <= '1'; -- Red for SW(3) = '1'
                end if;
            end if;
        end if;
    end process;

    -- Button and switch handling process to select note
    process(Clock100MHz)
    begin
        if rising_edge(Clock100MHz) then
            -- Default to no sound if no button is pressed
            if Button = "0000" then
                tone_count <= C4_COUNT; -- Default to C4 (silent)
                pwm_enable <= '0'; -- Disable buzzer
            else
                -- Select note based on button and switch state (priority to lower index)
                if Button(0) = '1' then
                    if SW(0) = '0' then
                        tone_count <= C4_COUNT; -- C4
                    else
                        tone_count <= C5_COUNT; -- C5
                    end if;
                    pwm_enable <= '1';
                elsif Button(1) = '1' then
                    if SW(1) = '0' then
                        tone_count <= D4_COUNT; -- D4
                    else
                        tone_count <= D5_COUNT; -- D5
                    end if;
                    pwm_enable <= '1';
                elsif Button(2) = '1' then
                    if SW(2) = '0' then
                        tone_count <= E4_COUNT; -- E4
                    else
                        tone_count <= E5_COUNT; -- E5
                    end if;
                    pwm_enable <= '1';
                elsif Button(3) = '1' then
                    if SW(3) = '0' then
                        tone_count <= G4_COUNT; -- G4
                    else
                        tone_count <= G5_COUNT; -- G5
                    end if;
                    pwm_enable <= '1';
                end if;
            end if;
        end if;
    end process;

    -- Clock divider and PWM generation process
    process(Clock100MHz)
        variable buzzer_state : STD_LOGIC := '0'; -- Internal buzzer state
    begin
        if rising_edge(Clock100MHz) then
            if counter < tone_count then
                counter <= counter + 1;
            else
                counter <= (others => '0');
                buzzer_state := not buzzer_state; -- Toggle for square wave
            end if;
            -- Output to buzzer only when enabled
            Buzzer <= buzzer_state and pwm_enable;
        end if;
    end process;
end Behavioral;
