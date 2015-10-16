From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 2/5] gpio: replace trivial implementations of
 request/free with generic one
Date: Fri, 16 Oct 2015 22:14:33 +0200
Message-ID: <CACRpkdYgMPugiTi+z_fgZSo08UUxGn=Jgt735q7CSwXA6wuZzg@mail.gmail.com>
References: <1444577659-17621-1-git-send-email-jogo@openwrt.org>
	<1444577659-17621-3-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:33032 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751985AbbJPUOe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 16:14:34 -0400
Received: by obbwb3 with SMTP id wb3so73104775obb.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 13:14:33 -0700 (PDT)
In-Reply-To: <1444577659-17621-3-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.org>

On Sun, Oct 11, 2015 at 5:34 PM, Jonas Gorski <jogo@openwrt.org> wrote:

> Replace all trivial request/free callbacks that do nothing but call into
> pinctrl code with the generic versions.
>
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: James Hogan <james.hogan@imgtec.com>
> Acked-by: Stefan Agner <stefan@agner.ch>
> Acked-by: Joachim Eastwood <manabian@gmail.com>

Patch applied (also added Gregory's ACK).

Yours,
Linus Walleij
