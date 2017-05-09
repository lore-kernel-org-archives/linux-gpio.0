From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [ANNOUNCE] libgpiod v0.2
Date: Tue, 9 May 2017 20:20:26 +0200
Message-ID: <CAMRc=Mc77s8pEEgtoaVinCmawYrEWVMVmq=cNvW+8WCsXjWQdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

I'm announcing the release of libgpiod v0.2.

The most prominent new feature is the test suite working together with
the gpio-mockup module (requires improvements available in linux 4.11)
which tests both the library code as well as the user space interface
of the GPIO subsystem.

Below is a brief changelog:

New features:
- relicensed under LGPLv2.1
- implemented a unit testing framework together with a comprehensive
  set of test cases
- added a non-closing variant of the gpiochip iterator and foreach
  macro [by Clemens Gruber]
- added gpiod_chip_open_by_label()

Improvements:
- Makefiles & build commands have been reworked [by Thierry Reding]
- documentation updates
- code shrinkage here and there
- coding style fixes
- removed all designated initializers from the header for better standards
  compliance

Bug fixes:
- fix the return value of gpiod_simple_event_loop()
- don't try to process docs if doxygen is not installed

Get it from github[1]. Should soon be available in buildroot as well.

Best regards,
Bartosz Golaszewski

[1] https://github.com/brgl/libgpiod
