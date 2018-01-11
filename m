From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: refactor drive strength get/set functions
Date: Thu, 11 Jan 2018 10:41:14 +0100
Message-ID: <CACRpkdY1aYZZFp=WgKhMUWk9v8DCmumwN6whYHQSPFjDFSY4vw@mail.gmail.com>
References: <1515573254-8894-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515573254-8894-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 10, 2018 at 9:34 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> There is code duplication between uniphier_conf_pin_drive_get() and
> uniphier_conf_pin_drive_set().  Factor out the common code into
> uniphier_conf_get_drvctrl_data().
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
