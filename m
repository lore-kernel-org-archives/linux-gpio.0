From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH RFT 5/5] pinctrl: replace trivial implementations of
 gpio_chip request/free
Date: Mon, 14 Sep 2015 09:53:52 -0700
Message-ID: <CAL1qeaFb5Ld=zN7t2QK-Ye2sCkNd89YqspueLkbh4_V3Ar2wSw@mail.gmail.com>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
	<1442150498-31116-6-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:33520 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755296AbbINQxx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2015 12:53:53 -0400
Received: by igbkq10 with SMTP id kq10so94830121igb.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2015 09:53:52 -0700 (PDT)
In-Reply-To: <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericss>

On Sun, Sep 13, 2015 at 6:21 AM, Jonas Gorski <jogo@openwrt.org> wrote:
> Replace all trivial request/free callbacks that do nothing but call into
> pinctrl code with the generic versions.
>
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>

>  drivers/pinctrl/pinctrl-pistachio.c           | 14 ++------------

For PIstachio,

Acked-by: Andrew Bresticker <abrestic@chromium.org>
