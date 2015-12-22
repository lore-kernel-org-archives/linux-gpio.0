From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] pinctrl: rockchip: add missing of_node_put
Date: Tue, 22 Dec 2015 13:48:35 +0100
Message-ID: <CACRpkdb4m9XHXbmnd9rUyetegBNySjyBn2LpcmN9TfU8stAr+g@mail.gmail.com>
References: <1450715988-4770-1-git-send-email-Julia.Lawall@lip6.fr>
	<1450715988-4770-5-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:36609 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751415AbbLVMsg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 07:48:36 -0500
Received: by mail-ob0-f174.google.com with SMTP id ba1so51996880obb.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 04:48:35 -0800 (PST)
In-Reply-To: <1450715988-4770-5-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Dec 21, 2015 at 5:39 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> for_each_child_of_node performs an of_node_get on each iteration, so a
> return from the loop requires an of_node_put.
>
> A simplified version of the semantic patch that fixes this problem is as
> follows (http://coccinelle.lip6.fr):

Patch applied with Heiko's review tag.

Yours,
Linus Walleij
