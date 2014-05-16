From: Daniel =?iso-8859-1?Q?Gl=F6ckner?= <dg@emlix.com>
Subject: Re: gpio: Add support for Intel SoC PMIC (Crystal Cove)
Date: Fri, 16 May 2014 19:46:20 +0200
Message-ID: <20140516174619.GA1471@emlix.com>
References: <1400082247-24168-1-git-send-email-lejun.zhu@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.emlix.com ([88.198.240.195]:50000 "EHLO mx1.emlix.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756948AbaEPRwt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 16 May 2014 13:52:49 -0400
Content-Disposition: inline
In-Reply-To: <1400082247-24168-1-git-send-email-lejun.zhu@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Zhu, Lejun" <lejun.zhu@linux.intel.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bin.yang@intel.com

Hi Lejun,

On Wed, May 14, 2014 at 11:44:07PM +0800, Zhu, Lejun wrote:
> This patch adds support for the GPIO function in Crystal Cove.

in our device ACPI makes use of "virtual" GPIOs that have numbers from
0x20 to 0x5E to change various bits in the PMIC. Do you know if this
is officially supported by the INT33FD ACPI device or if it is a
vendor hack?

  Daniel


--=20
Dipl.-Math. Daniel Gl=F6ckner, emlix GmbH, http://www.emlix.com
=46on +49 551 30664-0, Fax +49 551 30664-11,
Bertha-von-Suttner-Stra=DFe 9, 37085 G=F6ttingen, Germany
Sitz der Gesellschaft: G=F6ttingen, Amtsgericht G=F6ttingen HR B 3160
Gesch=E4ftsf=FChrung: Dr. Uwe Kracke, Ust-IdNr.: DE 205 198 055

emlix - your embedded linux partner
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
