From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: intel-gpio interrupts stop firing with Focaltech I2C-HID touchpad
Date: Fri, 17 Nov 2017 13:00:57 +0200
Message-ID: <20171117110057.GD17200@lahna.fi.intel.com>
References: <CAD8Lp47LZs6qbd00CDeX4s-eQkqf1dGO9VaFXuCaReQ2yE73Og@mail.gmail.com>
 <20171116115244.GQ17200@lahna.fi.intel.com>
 <CAD8Lp46fz-80hsOY1b4BFSHrr15Pk8nhYbaFh7MA0hquVSSc4g@mail.gmail.com>
 <20171116130743.GT17200@lahna.fi.intel.com>
 <CAB4CAwcqxBJNnaS9q7S7dy_1GoR5m1VHY89y+8g-G7rXBBJ1hg@mail.gmail.com>
 <20171117091134.GB17200@lahna.fi.intel.com>
 <CAB4CAwdsAXqb-2KQr3s1Z6UBJoBXwrks41qY5S8va=zz3UQ1hA@mail.gmail.com>
 <CAB4CAwfGsjtfZxHVvdyEAooqqK0whJS0MFZSsbm8+E0fi=hJyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:48484 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753151AbdKQLBJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Nov 2017 06:01:09 -0500
Content-Disposition: inline
In-Reply-To: <CAB4CAwfGsjtfZxHVvdyEAooqqK0whJS0MFZSsbm8+E0fi=hJyg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: Daniel Drake <drake@endlessm.com>, heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Endless Linux Upstreaming Team <linux@endlessm.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>

On Fri, Nov 17, 2017 at 06:01:27PM +0800, Chris Chiu wrote:
> Hi Mika,
>     Here's the full dmesg log you need. The touchpad stop reporting at
> the last of the log.
> https://gist.github.com/mschiu77/a0b8d24a586a228c55eca30c87c71d41

Thanks!

I did not spot anything suspicious in the i2c-hid initialization. When
the issue happens, can you check what the pin state is and if it changes
when you use the touchpad? If I read your ACPI tables right, something
like this:

  # grep GPIO_18 /sys/kernel/debug/pinctrl/INT3452:00/pins

(it could be another INT3452:* device as well).

The GPIO line should be high and when the touchpad is pressed it should
go low.

Then another thing, if you unload i2c-hid and load it back, does it
start working again?

  # modprobe -r i2c-hid
  # modprobe i2c-hid
