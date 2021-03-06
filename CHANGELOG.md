
## v0.4.6

### FEATURES

### ENHANCEMENTS

 - `Wire.end()` to release the I2C pins. [#597](https://github.com/spark/firmware/issues/597)
 - `Wire.reset()` to reset the I2C bus. Thanks @pomplesiegel [#598](https://github.com/spark/firmware/issues/598)
 - Detect when the cloud hasn't been serviced for 15s and disconnect, so device state accurately
reflects the connection state. [#626](https://github.com/spark/firmwarwe/issues/626)
 - Compile-time checks for `Particle.variable()` [#619](https://github.com/spark/firmwarwe/issues/619)
 - 

### BUGFIXES

 - Default SS pin for SPI1 now set to D5. [#623](https://github.com/spark/firmware/issues/623)
 - Long delay entering listening mode. [#566](https://github.com/spark/firmware/issues/566)
 - Solid green LED when WiFi network cannot be connected to due to invalid key. (The LED now blinks.)
 - Storing more than 2 Wi-Fi credentials would sometimes give unpredictable results.

## v0.4.5

### FEATURES
- `SPI.setClockDividerReference`, `SPI.setClockSpeed` to set clock speed in a more portable manner. [#454](https://github.com/spark/firmware/issues/454)
- `WiFi.scan` function to retrieve details of local access points. [#567](https://github.com/spark/firmware/pull/567)
- `UDP.sendPacket`/`UDP.receivePacket` to send/receive a packet directly to an application-supplied buffer. [#452](https://github.com/spark/firmware/pull/452)
- Static IP Support [photon] - [#451](https://github.com/spark/firmware/pull/451)
- [photon] UDP multicast support via `UDP.joinMulticast`/`UDP.leaveMulticast`. Many thanks @stevie67!
- `waitFor(WiFi.ready)` syntax to make it easier to wait for system events. [#415](https://github.com/spark/firmware/issues/415)
- Flexible time output with `Time.format()` [#572](https://github.com/spark/firmware/issues/572)

### ENHANCEMENTS

- [Recipes and Tips](docs/build.md#recipes-and-tips) section in the build documentation.
- `Particle.function`, `Particle.subscribe` and `attachInterrupt` can take a C++ method and instance pointer. [#534](https://github.com/spark/firmware/pull/534) Thanks to @monkbroc!
- `UDP.setBuffer` to set the buffer a UDP instance uses for `read`/`write`. [#224](https://github.com/spark/firmware/pull/224) and [#452](https://github.com/spark/firmware/pull/452)
- `WiFi.setCredentials()` can take a Cipher type to allow full specification of an AP's credentials. [#574](https://github.com/spark/firmware/pull/574)
- TCPClient (from TCPServer) reports remote IP address. [#551](https://github.com/spark/firmware/pull/551)
- Configurable format in `Time.timeStr()`, including ISO 8601. [#455](https://github.com/spark/firmware/issues/455)
- `Servo.trim(adjust)` to allow small adjustments to the stationary point. [#120](https://github.com/spark/firmware/issues/120)
- Time set from the cloud accounts for network latency. [#581](https://github.com/spark/firmware/issues/581)
- `String(Printable)` constructor so any `Printable` can be converted to a string. [example](https://community.particle.io/t/convert-ipaddress-to-string-for-use-with-spark-publish/14885/4?u=mdma)
- Fluent API on `String` - many methods return `*this` so method calls can be chained.
- Small values passed to `delay(1)` result in more accurate delays. [#260](https://github.com/spark/firmware/issues/260)
- Bootloader does not show factory reset modes if a factory reset image is not available. [#557](https://github.com/spark/firmware/issues/557)

### BUGFIXES

- Listening mode re-enters listening mode after credentials are given. [#558](https://github.com/spark/firmware/pull/558)
- String function dtoa() has problems with larger numbers. [#563](https://github.com/spark/firmware/pull/563)
- System doesn't set color of RGB LED when `RGB.control(true)` is called. [#362](https://github.com/spark/firmware/pull/362), [#472](https://github.com/spark/firmware/pull/472) and [#544](https://github.com/spark/firmware/pull/544)
- WiFi.SSID() may not return previous network when switching. [#560](https://github.com/spark/firmware/pull/560)
- [photon] System.sleep(5) not turning Wi-Fi back on after 5 seconds. [#480](https://github.com/spark/firmware/pull/480)
- regression: floating point support in sprintf not compiled in. [#576](https://github.com/spark/firmware/issues/576)
- [photon] SPI1 default clock speed was 7.5MHz, changed to 15MHz, same as for `SPI`.
- TCPClient::connected() doesn't detect when the socket is closed [#542](https://github.com/spark/firmware/issues/542)
- dfu-util: error during downlod get_status msg removed when using :leave option [#599](https://github.com/spark/firmware/issues/599)
- [Core] A0 could not be used as an output [#595](https://github.com/spark/firmware/issues/595)
- Reinstate CFOD handling on the Photon.

## v0.4.4

### FEATURES
 - logging output [documentation](docs/debugging.md)
 - pressing 'v' in SoftAP mode displays the system version. FIRM-128
 - P1: API (compatible with Core) to access the 1MByte external flash. [#498](https://github.com/spark/firmware/pull/498)
 - Arduino compatibility macros for PROGMEM and more.
 - `RGB.onChange` handler receives notification of the current LED color when it changes. Can be used to match an external LED to the onboard led. [#518](https://github.com/spark/firmware/pull/518) Thanks to @monkbroc!
 - Serial2 available on P1 and Photon (note: this also requires above RGB.onChange handler and two resistors would need to be removed on the Photon)
 - `Spark.connected()` et al. is now `Particle.connected()`. The former `Spark` library is still available but is deprecated.
 - `System.freeMemory()` API to determine the amount of available RAM.
 - `STARTUP()` macro to define blocks of code that execute at startup.

### ENHANCEMENTS
 - Retrieve the LED brightness via `RGB.brightness()`
 - More prominent color change on the RGB LED when there is a cloud connection error.
 - System.sleep() - 2nd parameter changed to `InterruptMode` from uint16_t to
 ensure the correct types are used. [#499](https://github.com/spark/firmware/pull/499)
 - Less aggressive exponential backoff when the re-establishing the cloud connection. [FIRM-177]
 - I2C Wire.endTransmission() returns unique values and [I2C docs updated](https://docs.particle.io/reference/firmware/photon/#endtransmission-)
 - Generate I2C STOP after slave addr NACK, I2C software reset all timeouts -  [commit](https://github.com/spark/firmware/commit/53914d809cc17a3802b879fbb4fddcaa7d264680)
 - Improved I2C Master receive method and implemented error handler - [commit](https://github.com/spark/firmware/commit/1bc00ea480ef1fcdbd8ef9ba3df12b121183aeae) -  [commit](https://github.com/spark/firmware/commit/5359f19985756182ff6511217cbcb588b3341a87)
 - `WiFi.selectAntenna()` default antenna is now INTERNAL. Can be called at startup (before WiFi is initialized to select the desired antenna.


### BUGFIXES

 - [Regression] System connects WiFi when Spark.connect() is called after WiFi.on() [#484](https://github.com/spark/firmware/issues/484)
 - [Debug build](https://github.com/spark/firmware/blob/develop/docs/debugging.md) now working.
 - PWM issue fixed - 500Hz output on all channels [#492](https://github.com/spark/firmware/issues/492)
 - Tone issue fixed on D2,D3,RX,TX [#483](https://github.com/spark/firmware/issues/483)
 - SOS when registering more than 2 subscription handlers, and allow 4 subscription handlers to be successfully registered. [#531](https://github.com/spark/firmware/issues/531)
 - SOS on TCPClient.connect() when DNS resolution failed or when connection fails [#490](https://github.com/spark/firmware/issues/490)
 - `TCPClient::stop()` does not work on first connection [#536](https://github.com/spark/firmware/issues/536)
 - `TCPClient::connect()` does not close an existing socket. [#538](https://github.com/spark/firmware/issues/538)
 - TX/RX PWM randomly inverted [#545](https://github.com/spark/firmware/issues/545)
 - UDP.begin/write return values [#552](https://github.com/spark/firmware/issues/552)

## v0.4.3

### FEATURES
 - Half-duplex mode on Serial1 via `Serial1.halfdupliex()`. Thanks to @prices.
 - `WiFi.connect(WIFI_CONNECT_SKIP_LISTEN)` allows application firmware to skip listen mode when there is no credentials.
 - System events

### ENHANCEMENTS
 - I2C methods now use `micros()` for timeouts rather than `millis()`, so I2C functions can be used in an interrupt handler. [#460](https://github.com/spark/firmware/issues/460)
 - `WiFi.listen(false)` to programmatically exit WiFi listening mode.
 - make is verbose by default. To silence, add `-s` to the command line.
 - `WiFi.connect(WIFI_CONNECT_SKIP_LISTEN)` starts connection but does not enter listening mode if no credentials are found.
 - Setup/Mode button now starts listening mode when WiFi is off.
 - `WiFi.listen(false)` can be used to exit listening mode (from an interrupt.)
 - LED flashes high-speed green when requesting an IP address via DHCP.

### BUGFIXES

 - [Photon/TCPServer] - `TCPClient.connected()` was not returning `false` when the socket was asynchronously disconnected.
 - Fix time being reset on wakeup. (removed WICED RTC init code that resets to default preset time in platform_mcu_powersave_init() within photon-wiced repo.) [#440](https://github.com/spark/firmware/issues/440)
 - `TCPClient.connected()` was not returning `false` when the socket was disconnected from the other end.
 - `strdup()` was returning garbage [#457](https://github.com/spark/firmware/issues/457)
 - `attachInterrupt()` should work on all interrupt pins now except D0 & A5. Please note there are shared lines as per the following issue comment : [#443] (https://github.com/spark/firmware/issues/443#issuecomment-114389744)
 - I2C bus lockup when no slave devices are present by issuing a STOP condition after sLave send address fails.
 - `spark/` events not propagated to application handlers. [#481](https://github.com/spark/firmware/issues/481)
 - `sprintf` calls not linking correctly. [#471](https://github.com/spark/firmware/issues/471)
 - Photon/P1 sometimes did not start without hitting reset after a cold boot.
 - Disable LTO compile for user firmware since it causes linking problems (see `sprintf` above.)

## v0.4.2

### FEATURES
 - EEPROM storage of custom data types via `EEPROM.put()` and `EEPROM.get()'
 - When the device is in safe mode, the LED breathes magenta
 - `attachSystemInterrupt()` allows hooking key system interrupts in user code.
 - [DMA-driven SPI master](https://github.com/spark/docs/pull/49)
 - `UDP.sendPacket()` method avoids buffering data when the user can supply the entire buffer at once.
 - [Photon] SoftAP setup can be done over HTTP
 - platform-neutral fast pin access [449](https://github.com/spark/firmware/pull/449)
 - [P1] Serial2 support

### ENHANCEMENTS

 - [Photon] The system firmware updates the bootloader to latest version
 - [Photon] The system write protects the bootloader region.
 - UDP uses dynamically allocated buffers
 - `PRODUCT_ID` and `PRODUCT_VERSION` place these details at a known place in the firmware image
 - DFU mode and serial firmware update can be triggered by setting the line rate.

### BUGFIXES

 - `Serial1.end()` [hangs the system](https://community.particle.io/t/changing-serial-baud-rate-inside-setup-code-causes-core-freezing-afterwards/10314/6)
 - Malformed CoAP acknowledgement message in cloud protocol.
 - `SPARK_WLAN_Loop()` was not linked. (Workaround was to use `Spark.process()`)
 - UDP doesn't send anything to the device until `UDP.write()` [#407](https://github.com/spark/firmware/issues/407)
 - Divide by zero now caught and causes a SOS.
 - Floating-point support for `sprintf()` reinstated
 - Fixed WICED DCT becoming unmodifiable
 - Fix UDP.parsePacket() not receiving any data on the Photon [#468](https://github.com/spark/firmware/issues/468)

## v0.4.1

### ENHANCEMENTS

- Signed Photon USB Driver for use with Windows 8.1


### BUGFIXES

 - `Spark.syncTime()` was not linked. [#426](https://github.com/spark/firmware/issues/426)
 - Wire.setSpeed(CLOCK_SPEED_100KHZ) was not linked. [#432](https://github.com/spark/firmware/issues/432)
 - WiFi.selectAntenna() was not linked.

## v0.4.0

### NEW PLATFORMS
- PHOTON!!!!


### ENHANCEMENTS

 - `loop()` iteration rate increased by 1000 times - from 200 Hz to over 200 kHz!
 - Compiler: Removed all warnings from the compile (and made warnings as errors) so compiler output is minimal.
 - Debugging: SWD Support, thanks to Elco Jacobs. [#337](https://github.com/spark/core-firmware/pull/337)
 - `Spark.publish()` returns a success value - [#388](https://github.com/spark/firmware/issues/388)
 - `Spark.process()` as the public API for running the system loop. [#347](https://github.com/spark/firmware/issues/347)
 - Sleep no longer resets (on the Photon) [#283](https://github.com/spark/firmware/issues/283)
 - Support for application code outside of the firmware repo. [#374](https://github.com/spark/firmware/issues/374)
 - MAC Address available in setup via 'm' key. [#352](https://github.com/spark/firmware/issues/352)
 - SoftAP setup on the Photon
 - `Spark.sleep()` changed to `System.sleep()` and similarly for `deviceID()` [#390](https://github.com/spark/firmware/issues/390)
 - Listening mode uses existing serial connection if already opened. [#384](https://github.com/spark/firmware/issues/384)
 - `Spark.publish("event", PRIVATE)` shorthand - [#376](https://github.com/spark/firmware/issues/376)
 - Improved integrity checks for firmware images
 - Added additional safe/recovery mode in bootloader (> 6.5 sec : restore factory code without clearing wifi credentials)
 - Enabled CRC verification in bootloader before restoring/copying the firmware image from factory reset, ota downloaded area etc.
 - Added 'program-serial' to build target to enter serial ymodem protocol for flashing user firmware (Testing pending...)
 - Cloud string variables can be re-defined [#241](https://github.com/spark/firmware/issues/241)
 - Removed hard-coded limit on number of functions and variables [#111](https://github.com/spark/firmware/issues/111)
 - Parameterized function callbacks, lambda support for functions [#311](https://github.com/spark/firmware/issues/313)
 - C++ STL headers supported
- Can duplicate the onboard RGB LED color in firmware. [#302](https://github.com/spark/firmware/issues/302)
- `WiFi.selectAntenna()` - select between internal (chip) and external (u.FL) antenna on Photon: [#394](https://github.com/spark/firmware/issues/394)
- `WiFi.resolve()` to look up an IP address from a domain name. [#91](https://github.com/spark/firmware/issues/91)
- `System.dfu()` to reboot the core in dfu mode, until next reset or next DFU update is received.


### BUGFIXES

- SOS calling `Spark.publish()` in `SEMI_AUTOMATIC`/`MANUAL` mode
- Subscriptions maintained when cloud disconnected. [#278](https://github.com/spark/firmware/issues/278)
- Fix for events with composite names. [#382](https://github.com/spark/firmware/issues/382)
- `WiFi.ready()` returning true after `WiFi.off()` in manual mode. [#378](https://github.com/spark/firmware/issues/378)
- `Serial.peek()` implemented. [#387](https://github.com/spark/firmware/issues/387)
- Mode button not working in semi-automatic or manual mode. [#343](https://github.com/spark/firmware/issues/343)
- `Time.timeStr()` had a newline at the end. [#336](https://github.com/spark/firmware/issues/336)
- `WiFi.RSSI()` caused panic in some cases. [#377](https://github.com/spark/firmware/issues/377)
- `Spark.publish()` caused SOS when cloud disconnected. [#322](https://github.com/spark/firmware/issues/332)
- `TCPClient.flush()` discards data in the socket layer also. [#416](https://github.com/spark/firmware/issues/416)


### UNDER THE HOOD

 - Platform: hardware dependencies are factored out from wiring into a hardware abstraction layer
 - Repo: all 3 spark repos (core-common-lib, core-communication-lib, core-firmware) are combined into this repo.
 - Modularization: factored common-lib into `platform`, `services` and `hal` modules.
 - Modularization: factored core-firmware into `wiring`, `system`, 'main' and `user` modules.
 - Modularization: user code compiled as a separate library in the 'user' module
 - Build system: fancy new build system - [build/readme.md](build/readme.md)
 - Modularization: modules folder containing dynamically linked modules for the Photon



## v0.3.4

### FEATURES

- Local Build: Specify custom toolchain with `GCC_PREFIX` environment variable ([firmware](https://github.com/spark/firmware/pull/328), [core-common-lib](https://github.com/spark/core-common-lib/pull/39), [core-communication-lib](https://github.com/spark/core-communication-lib/pull/29))

### ENHANCEMENTS

- Wiring: More efficient and reliable `print(String)` (fix issue [#281](https://github.com/spark/firmware/issues/281)) [#305](https://github.com/spark/firmware/pull/305)
- DFU: Add DFU suffix to .bin file [#323](https://github.com/spark/firmware/pull/323)

### BUGFIXES

- I2C: Use I2C polling mode by default [#322](https://github.com/spark/firmware/pull/322)
- Listening Mode: Fix hard fault when Wi-Fi is off [#320](https://github.com/spark/firmware/pull/320)
- LED Interaction: Fix breathing blue that should be blinking green [#315](https://github.com/spark/firmware/pull/315)


## v0.3.3

### FEATURES

 - Cloud: [Secure random seed](https://github.com/spark/core-communication-lib/pull/25). When the spark does a handshake with the cloud, it receives a random number that is set as a seed for `rand()`
 - Wiring: Arduino-compatible `random()` and `randomSeed()` functions. [#289](https://github.com/spark/core-firmware/pull/289)
 - Wiring: Arduino-compatible functions like `isAlpha()` and `toLowerCase()`. [#293](https://github.com/spark/core-firmware/pull/293)

### ENHANCEMENTS

 - Wire: added missing Slave mode using DMA/Interrupts and updated Master mode using DMA. New APIs `Wire.setSpeed()` and `Wire.strechClock()`. [#284](https://github.com/spark/core-firmware/issues/284)
 - Sleep: `Spark.sleep()` supports wakeup on pin change. [#265](https://github.com/spark/core-firmware/issues/265)

### BUGFIXES

 - RGB: calling `RGB.brightness()` doesn't change the LED brightness immediately [#261](https://github.com/spark/core-firmware/issues/261)
 - Wiring: `pinMode()` `INPUT` and `OUTPUT` constants had reversed values compared to Arduino. [#282](https://github.com/spark/core-firmware/issues/282)
 - Wiring: compiler error using `HEX` with `String`. [#210](https://github.com/spark/core-firmware/pull/210)
 - System Mode: MANUAL mode breaks OTA update [#294](https://github.com/spark/core-firmware/issues/294)

## pre v0.3.3 versions

See https://github.com/spark/core-firmware/releases
