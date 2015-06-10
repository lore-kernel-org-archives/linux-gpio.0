From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/4] sh-pfc: handle pin array holes in sh_pfc_map_pins()
Date: Wed, 10 Jun 2015 09:49:13 +0200
Message-ID: <CACRpkdYXHbP0jhvNxojhh=Mr-NCe-ismBp7g5T5_vYLFDz9rtw@mail.gmail.com>
References: <4326653.qPvIJDU6F2@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <4326653.qPvIJDU6F2@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 5, 2015 at 1:23 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> Hello.
>
>    Here's the set of 4 patches against the 'devel' branch of Linus Walleij's
> 'linux-pinctrl.git' repo. Here we add proper handling of the pin array "holes"
> and then remove unused GPIO pins for R8A7790/1 SoCs.
>
> [1/4] sh-pfc: do not call sh_pfc_get_pin_index() when unnecessary
> [2/4] sh-pfc: handle pin array holes
> [3/4] sh-pfc: r8a7790 remove non-existing GPIO pins
> [4/4] sh-pfc: r8a7791 remove non-existing GPIO pins

Waiting for Laurent to review this series.

Yours,
Linus Walleij
