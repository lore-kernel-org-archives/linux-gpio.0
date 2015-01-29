From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: correctly use const char * const
Date: Thu, 29 Jan 2015 10:30:23 +0100
Message-ID: <CACRpkdaRedRJdn_Jj584=zrNdePrNr2bQLHSsyNiMPHJyVkGdQ@mail.gmail.com>
References: <1421872537-18587-1-git-send-email-o.schinagl@ultimaker.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421872537-18587-1-git-send-email-o.schinagl@ultimaker.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olliver Schinagl <o.schinagl@ultimaker.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Olliver Schinagl <oliver@schinagl.nl>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 21, 2015 at 9:35 PM, Olliver Schinagl
<o.schinagl@ultimaker.com> wrote:

> From: Olliver Schinagl <oliver@schinagl.nl>
>
> On my previous patch I was overly hasty and made the suffixes string
> array
> const char const *suffixes, instaed of const char * const suffixes. This
> patch corrects that
>
> Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>

Patch applied.

Yours,
Linus Walleij
