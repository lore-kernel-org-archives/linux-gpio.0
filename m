From: Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH] kernel/resource.c: fix muxed resource handling in
 __request_region()
Date: Mon, 22 Feb 2016 13:49:12 +0000
Message-ID: <1456148952.24303.273.camel@linux.intel.com>
References: <20150909220140.GD9892@kw.sim.vm.gnt>
	 <1441836918-24159-1-git-send-email-simon.guinot@sequanux.org>
	 <20160219221056.23487da2@x2> <56C7A459.1090801@virtuousgeek.org>
	 <CA+55aFx9-itKjqahUnXAoeDNgbi1MeNH5gDQB8Sw9AguPwGefQ@mail.gmail.com>
	 <15300c0ce08.2710.f266623ac48c822f02e65082a71b2734@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:9504 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755121AbcBVNuO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 22 Feb 2016 08:50:14 -0500
In-Reply-To: <15300c0ce08.2710.f266623ac48c822f02e65082a71b2734@virtuousgeek.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jesse Barnes <jbarnes@virtuousgeek.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Vincent Pelletier <plr.vincent@gmail.com>, Simon Guinot <simon.guinot@sequanux.org>, Giel van Schijndel <me@mortis.eu>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>

> we have some good alternatives in the form of bus and platform
> drivers that
> can manage the appropriate serialization and keep things from
> stomping
> on one another.

It's not used much, especially nowdays. The use case is basically multi
I/O chips on the ISA/LPC bus with magic shared config register ports.

We have sufficiently few of those we could give muxed the boot and
special case them if preferred.

Alan


