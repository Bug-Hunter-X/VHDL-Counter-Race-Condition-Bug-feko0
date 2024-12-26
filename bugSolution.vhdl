```vhdl
entity counter_sync_reset is
  Port ( clk : in  STD_LOGIC;
         rst : in  STD_LOGIC;
         count : out  INTEGER range 0 to 15);
end entity;

architecture behavioral of counter_sync_reset is
  signal internal_count : INTEGER range 0 to 15 := 0;
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        internal_count <= 0;
      else
        if internal_count = 15 then
          internal_count <= 0;
        else
          internal_count <= internal_count + 1;
        end if;
      end if;
    end if;
  end process;

  count <= internal_count;
end architecture;
```