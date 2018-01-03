From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 08/12] pinctrl: axp209: account for const type of of_device_id.data
Date: Wed, 3 Jan 2018 08:59:26 +0100
Message-ID: <CACRpkdbiM=5KpG8PQndX2L9RN0AoNpuz-foWBLAWO_9vEN5osQ@mail.gmail.com>
References: <1514899688-27844-1-git-send-email-Julia.Lawall@lip6.fr> <1514899688-27844-9-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1514899688-27844-9-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 2, 2018 at 2:28 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> The return value of of_device_get_match_data has type const void *.
> The desc field of the pctl structure also has a const type, so there
> is no need for the const-discarding cast between them.
>
> Done using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied.

Yours,
Linus Walleij
