From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 11/11] gpio: xlp: fix error return code
Date: Wed, 26 Aug 2015 14:50:00 +0200
Message-ID: <CACRpkdZQ8E=A5RFsk31y83NFpxB4Yq2gKgaSpzxBMR7cjr5FiQ@mail.gmail.com>
References: <1440288682-12732-1-git-send-email-Julia.Lawall@lip6.fr>
	<1440288682-12732-12-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <1440288682-12732-12-git-send-email-Julia.Lawall@lip6.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Aug 23, 2015 at 2:11 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Return a negative error code on failure.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> identifier ret; expression e1,e2;
> @@
> (
> if (\(ret < 0\|ret != 0\))
>  { ... return ret; }
> |
> ret = 0
> )
> ... when != ret = e1
>     when != &ret
> *if(...)
> {
>   ... when != ret = e2
>       when forall
>  return ret;
> }
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied.

Yours,
Linus Walleij
