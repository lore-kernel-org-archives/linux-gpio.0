From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pinconf: separate config parameters with commas
 for debugfs
Date: Tue, 31 May 2016 10:29:41 +0200
Message-ID: <CACRpkdZo4PwbiOLuhSFp-gNf_anOpFzxLeoKB0qYxWwGKrb1pg@mail.gmail.com>
References: <1464158248-19048-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464158248-19048-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 25, 2016 at 8:37 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> To improve debugfs readability, use commas instead of whitespaces
> for separating configuration parameters.
>
> For example, the "pinconf-pins" dump on my board will change as follows:
>
> Without this commit:
>
>  # head -5 pinconf-pins
>  Pin config settings per pin
>  Format: pin (name): configs
>  pin 0 (ED0): input bias pull down output drive strength (8 mA) input enabled
>  pin 1 (ED1): input bias pull down output drive strength (8 mA) input enabled
>  pin 2 (ED2): input bias pull down output drive strength (8 mA) input enabled
>
> With this commit:
>
>  # head -5 pinconf-pins
>  Pin config settings per pin
>  Format: pin (name): configs
>  pin 0 (ED0): input bias pull down, output drive strength (8 mA), input enabled
>  pin 1 (ED1): input bias pull down, output drive strength (8 mA), input enabled
>  pin 2 (ED2): input bias pull down, output drive strength (8 mA), input enabled
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Much better like this, thanks!

Patch applied.

Yours,
Linus Walleij
