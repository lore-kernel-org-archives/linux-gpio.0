From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: [PATCH] kernel/resource.c: fix muxed resource handling in
 __request_region()
Date: Tue, 23 Feb 2016 09:00:24 +0100
Message-ID: <20160223090024.2963da69@x2>
References: <20150909220140.GD9892@kw.sim.vm.gnt>
	<1441836918-24159-1-git-send-email-simon.guinot@sequanux.org>
	<20160219221056.23487da2@x2>
	<56C7A459.1090801@virtuousgeek.org>
	<CA+55aFx9-itKjqahUnXAoeDNgbi1MeNH5gDQB8Sw9AguPwGefQ@mail.gmail.com>
	<15300c0ce08.2710.f266623ac48c822f02e65082a71b2734@virtuousgeek.org>
	<1456148952.24303.273.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:35559 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932326AbcBWH5z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2016 02:57:55 -0500
In-Reply-To: <1456148952.24303.273.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alan Cox <alan@linux.intel.com>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Linus Torvalds <torvalds@linux-foundation.org>, Simon Guinot <simon.guinot@sequanux.org>, Giel van Schijndel <me@mortis.eu>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>

On Mon, 22 Feb 2016 13:49:12 +0000, Alan Cox <alan@linux.intel.com>
wrote:
> It's not used much, especially nowdays. The use case is basically multi
> I/O chips on the ISA/LPC bus with magic shared config register ports.

This is precisely a super I/O driver (gpio-f7188x) which, when used
with concurrent accesses on an SMP machine triggered the issue which
prompted this patch.

In case information on the original issue is desired:
My original report (ignore attached patch, it was rejected as it
breaks other chips supported by this driver):
  http://permalink.gmane.org/gmane.linux.kernel.gpio/10204
My test procedure (second half of the mail), which I used to validate
the patch against 4.1:
  http://permalink.gmane.org/gmane.linux.kernel.gpio/10216
Simon Guinot & Vincent Donnefort debugging results:
  http://permalink.gmane.org/gmane.linux.kernel.gpio/10521

Regards,
-- 
Vincent Pelletier
