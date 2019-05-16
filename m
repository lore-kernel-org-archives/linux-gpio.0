From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: sch: Add interrupt support
Date: Thu, 16 May 2019 14:20:14 +0200
Message-ID: <CACRpkdZJSYFYuJYtubUHyPhSkiHi0eUX_hmbmmXqO2XPg6rJcw@mail.gmail.com>
References: <20190424081802.GV2654@lahna.fi.intel.com> <5a28f22c-22f7-760a-d076-68ff19800d44@siemens.com>
 <20190424084259.GW2654@lahna.fi.intel.com> <7e328b7e-f4f0-851a-4152-a9ffd058201c@siemens.com>
 <20190424094506.GA2654@lahna.fi.intel.com> <292e6eff-82cc-6e4d-925b-77a60399e2e0@siemens.com>
 <20190424100130.GB2654@lahna.fi.intel.com> <1200464b-f969-ebc2-ae82-1f8ca98aaca1@siemens.com>
 <20190424103306.GC2654@lahna.fi.intel.com> <9377620b-d74a-04d9-a51e-8590400b1c0f@siemens.com>
 <20190426130615.GT9224@smile.fi.intel.com> <bd5453e1-0279-02ab-3304-edc6ebf509dc@siemens.com>
 <bc856e19-470d-7655-5680-a031831ab513@metux.net> <2f3da791-4a10-c2c4-dc5a-22ad16ed7be6@siemens.com>
 <ea29ee73-705b-7d13-0084-11274db02394@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ea29ee73-705b-7d13-0084-11274db02394@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi folks,

this became an interesting thread and Manivannan made some nice
changes to MRAA as a result.

It appears the Raspberry Pi has become a victim of its own success
and went from hobbyist toy system to a foundation for random industrial
control hacks. I'm a bit scared about that for electronic reasons but when
it comes to the software that is a board that get things right after
we added line-names to everything on its connectors.

What I can add is that when designing the character device I tried to get some
input from inductrial control (PLC) vendors and asked on the mailing list,
and mailed directly to ABB at one point, I am sorry for not finding the right
contact at Siemens (would have helped for sure).

I have tried to talk to Liebherr in related matters but can't seem to find the
right contact.

We really want to do things right with industrial control boards because
these seem to have very long life cycles and stay around forever in the
kernel for that reason.

Yours,
Linus Walleij
