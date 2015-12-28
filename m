From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/2] pinctrl: intel: on enable on x86 arches and
 COMPILE_TEST
Date: Mon, 28 Dec 2015 14:37:23 +0200
Message-ID: <20151228123723.GV1758@lahna.fi.intel.com>
References: <1451218972-22156-1-git-send-email-pbrobinson@gmail.com>
 <1451218972-22156-2-git-send-email-pbrobinson@gmail.com>
 <20151228120010.GU1758@lahna.fi.intel.com>
 <CALeDE9MtO0BiuHUORQo0rO02hBvdL7o47B86ycbYUyjqq2xspw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:50872 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751845AbbL1Mh1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 28 Dec 2015 07:37:27 -0500
Content-Disposition: inline
In-Reply-To: <CALeDE9MtO0BiuHUORQo0rO02hBvdL7o47B86ycbYUyjqq2xspw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Mon, Dec 28, 2015 at 12:13:32PM +0000, Peter Robinson wrote:
> On Mon, Dec 28, 2015 at 12:00 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Sun, Dec 27, 2015 at 12:22:51PM +0000, Peter Robinson wrote:
> >> If you select CONFIG_PINCTR for another unrelated architecture
> >> you need to set all the Intel pinctrl options even though they're not
> >> required. Mask them if not required.
> >>
> >> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >> ---
> >>  drivers/pinctrl/intel/Kconfig | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
> >> index 4d2efad..68fa13a 100644
> >> --- a/drivers/pinctrl/intel/Kconfig
> >> +++ b/drivers/pinctrl/intel/Kconfig
> >> @@ -2,6 +2,8 @@
> >>  # Intel pin control drivers
> >>  #
> >>
> >> +if X86_GENERIC || COMPILE_TEST
> >> +
> >>  config PINCTRL_BAYTRAIL
> >>       bool "Intel Baytrail GPIO pin control"
> >>       depends on GPIOLIB && ACPI
> >
> > All of them already depend on CONFIG_ACPI so if your unrelated
> > architecture does not provide that then you should not see any of these.
> 
> ACPI is available on arm64 and there's patches around for ARM, none of
> which would support the intel hardware, hence the patch.

I see.

Then I suggest you use "if X86 || COMPILE_TEST" instead of X86_GENERIC
because the latter does not even cover 64-bit CPUs (and is more about
optimizing for generic 32-bit CPUs than selecting proper CPU
architecture).
