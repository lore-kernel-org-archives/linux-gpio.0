From: "Zhu, Lejun" <lejun.zhu@linux.intel.com>
Subject: Re: gpio: Add support for Intel SoC PMIC (Crystal Cove)
Date: Mon, 19 May 2014 09:46:18 +0800
Message-ID: <5379626A.9020203@linux.intel.com>
References: <1400082247-24168-1-git-send-email-lejun.zhu@linux.intel.com> <20140516174619.GA1471@emlix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:54160 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750969AbaESBqV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 18 May 2014 21:46:21 -0400
In-Reply-To: <20140516174619.GA1471@emlix.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?ISO-8859-1?Q?Daniel_Gl=F6ckner?= <dg@emlix.com>, aaron.lu@intel.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bin.yang@intel.com



On 5/17/2014 1:46 AM, Daniel Gl=F6ckner wrote:
> Hi Lejun,
>=20
> On Wed, May 14, 2014 at 11:44:07PM +0800, Zhu, Lejun wrote:
>> This patch adds support for the GPIO function in Crystal Cove.
>=20
> in our device ACPI makes use of "virtual" GPIOs that have numbers fro=
m
> 0x20 to 0x5E to change various bits in the PMIC. Do you know if this
> is officially supported by the INT33FD ACPI device or if it is a
> vendor hack?
>=20
>   Daniel
>=20

Hi, sorry I'm quite familiar with ACPI. I know Aaron is looking at the
possibility to use these pins in Linux ACPI, but so far we don't have
any code.

Best Regards
Lejun
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
