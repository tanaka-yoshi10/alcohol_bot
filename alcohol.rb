require 'serialport'

module Ruboty
  module Handlers
    class Alcohol < Base
      on(
        /alcohol/,
        name: "alcohol",
        description: "Return alcohol"
      )
      on(
        /tap_on/,
        name: "tap_on",
        description: "tap on"
      )
      on(
        /tap_off/,
        name: "tap_off",
        description: "tap off"
      )
 
      def alcohol(message)
        sp = SerialPort.new('/dev/tty.usbserial-DA00S1WC', 9600, 8, 1, 0) # 9600bps, 8bit, stopbit 1, parity none

        line = sp.gets
        
        message.reply("#{line.strip} :beers:")
      end

      def tap_on(message)
          sp = SerialPort.new("/dev/tty.usbmodem411", 57600, 8, 1, 0)
          sp.puts "w1,97,26,26,8,8,8,8,8,18,8,18,8,18,8,18,8,8,8,8,8,30,26,26,8,8,8,8,8,18,8,18,8,18,8,18,8,8,8,8,8,28,26,26,9,8,8,8,8,18,8,18,8,18,8,18,8,8,8,8,8,0W"
          message.reply("tap on done")
      end

      def tap_off(message)
          sp = SerialPort.new("/dev/tty.usbmodem411", 57600, 8, 1, 0)
          sp.puts "w26,26,8,8,8,18,8,8,8,8,8,18,8,8,8,18,8,18,8,30,26,26,8,8,8,18,8,8,8,8,8,18,8,8,8,18,8,18,8,28,26,26,8,8,8,18,8,8,8,8,8,18,8,8,8,18,8,18,8,28,26,26,8,8,8,18,8,8,8,8,8,18,8,8,8,18,8,18,8,111,1,172,26,26,8,8,8,18,8,8,8,8,8,18,8,8,8,18,8,18,8,28,26,26,8,8,8,18,8,8,8,8,8,18,8,8,8,18,8,18,8,0W"
          message.reply("tap off done")
      end

    end
  end
end
