From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/7] pinctrl: meson: Add a bunch more pins
Date: Thu, 26 May 2016 11:28:44 +0200
Message-ID: <CACRpkdbURowJNT_ZkKuv7C_3oW3BJGPBK6etKc4cBc4ujQdPXw@mail.gmail.com>
References: <1462544486-9516-1-git-send-email-khilman@baylibre.com>
	<CACRpkdY9oGZLt431NwTaFmZk98O8n3ZnMA1odhYZtcH7P1p=Jg@mail.gmail.com>
	<m260u3ia37.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33233 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750791AbcEZJ2o (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 May 2016 05:28:44 -0400
Received: by mail-oi0-f53.google.com with SMTP id k23so115539722oih.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 May 2016 02:28:44 -0700 (PDT)
In-Reply-To: <m260u3ia37.fsf@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, Carlo Caione <carlo@caione.org>, linux-meson <linux-meson@googlegroups.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Victor Wan <victor.wan@amlogic.com>, Jerry Cao <jerry.cao@amlogic.com>, Xing Wu <xing.xu@amlogic.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 24, 2016 at 8:29 PM, Kevin Hilman <khilman@baylibre.com> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:

> Looking closer, these have dependencies on the DT changes that you've
> suggested we take through arm-soc, so it would be cleaner if I take
> these with your ack through the amlogic tree.

I really prefer to take DT changes and driver code in different
trees i possible.

My reasoning is plainly: if the DT stuff was a separate git, as
has been explicitly suggested as a goal off and on, this should
be merge:able still. So DT changes and driver code should ideally
be orthogonal.

I don't know about this case but is it a disaster if one or the other
of the DT changes and the driver arrive in different order to Torvald's
tree, or will it simply be that the lights go on when the last patch
arrives?

Yours,
Linus Walleij
