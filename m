From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] pinctrl: sirf: add missing of_node_put
Date: Tue, 22 Dec 2015 13:45:19 +0100
Message-ID: <CACRpkdag9qaAiAqdGmFm9UMxzJ+S9DBs0Br2MdeE=x8_EYx2PA@mail.gmail.com>
References: <1450715988-4770-1-git-send-email-Julia.Lawall@lip6.fr>
	<1450715988-4770-3-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <1450715988-4770-3-git-send-email-Julia.Lawall@lip6.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Barry Song <baohua@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 21, 2015 at 5:39 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> for_each_child_of_node performs an of_node_get on each iteration, so a
> return from the loop requires an of_node_put.
>
> A simplified version of the semantic patch that fixes this problem is as
> follows (http://coccinelle.lip6.fr):

Patch applied.

Yours,
Linus Walleij
