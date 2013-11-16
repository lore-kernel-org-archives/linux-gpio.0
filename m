From: arno@natisbad.org (Arnaud Ebalard)
Subject: Warning masked by BUG() when CONFIG_BUG is enabled
Date: Sat, 16 Nov 2013 23:52:08 +0100
Message-ID: <87a9h4559j.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp3-g21.free.fr ([212.27.42.3]:36939 "EHLO smtp3-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753215Ab3KPWwh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Nov 2013 17:52:37 -0500
Received: from smtp.natisbad.org (unknown [81.57.185.249])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 06758A6277
	for <linux-gpio@vger.kernel.org>; Sat, 16 Nov 2013 23:52:27 +0100 (CET)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, cocci@systeme.lip6.fr, Julia Lawall <Julia.Lawall@lip6.fr>

Hi,

While compiling a kernel, I got the following warnings which are due to
missing returns in the following functions:

  CC      fs/xattr.o
  CC      crypto/cryptd.o
  CC      lib/irq_regs.o
  CC      lib/is_single_threaded.o
  CC      lib/klist.o
drivers/gpio/gpio-mvebu.c: In function =E2=80=98mvebu_gpioreg_edge_mask=
=E2=80=99:
drivers/gpio/gpio-mvebu.c:148:1: warning: control reaches end of non-vo=
id function [-Wreturn-type]
drivers/gpio/gpio-mvebu.c: In function =E2=80=98mvebu_gpioreg_edge_caus=
e=E2=80=99:
drivers/gpio/gpio-mvebu.c:130:1: warning: control reaches end of non-vo=
id function [-Wreturn-type]
drivers/gpio/gpio-mvebu.c: In function =E2=80=98mvebu_gpioreg_level_mas=
k=E2=80=99:
drivers/gpio/gpio-mvebu.c:166:1: warning: control reaches end of non-vo=
id function [-Wreturn-type]
  CC      lib/kobject.o
  CC      lib/kobject_uevent.o
  CC      lib/md5.o
  CC      lib/percpu-refcount.o

I was kind of curious not to have noticed it during kernel builds for
armada 370/xp targets. The reason is the following: on my Armada 370/XP
builds, I had CONFIG_BUG=3Dy which makes BUG() call panic() (which neve=
r
returns). Otherwise, BUG() is a nop and the 'default' branch below is n=
o
more a catch-all barrier in previous functions. For the discussion,
those have the same structure:

static inline void __iomem *mvebu_gpioreg_edge_cause(...)
{
	int cpu;

	switch (mvchip->soc_variant) {
	case MVEBU_GPIO_SOC_VARIANT_ORION:
	case MVEBU_GPIO_SOC_VARIANT_MV78200:
		return sth;
	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
		return sth;
	default:
		BUG();
	}
}

*Out of curiosity*, are there no generic solutions to handle such a cas=
e?
In the end, if BUG() has been put here on purpose (i.e. this is the onl=
y
solution, which it kinds of looks like here) wouldn't it be more logica=
l
to call panic() here directly?

As a side note, I noticed quite some instances of that pattern (switch
statement w/ a 'default' calling BUG()) while more carefully looking at
compilation output. I may get slapped for this, but just in case this
is indeed something which deserves to be fixed and can be fixed
automagically via some semantic patch, I have CC'ed Coccinelle people.

Cheers,

a+
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
