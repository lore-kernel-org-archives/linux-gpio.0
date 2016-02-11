From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: H3 requires irq_read_needs_mux
Date: Thu, 11 Feb 2016 13:01:32 +0100
Message-ID: <CACRpkdbp2J5eVwsJpuyxkjv72mB4ojcauXoDn1_iei7XB0yzxg@mail.gmail.com>
References: <20160202100217.GA7483@box2.japko.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160202100217.GA7483@box2.japko.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Adamski <krzysztof.adamski@sonymobile.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Rob Herring <robh@kernel.org>, Jens Kuske <jenskuske@gmail.com>, Fabian Frederick <fabf@skynet.be>, Vishnu Patekar <vishnupatekar0510@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 2, 2016 at 11:03 AM, Krzysztof Adamski
<krzysztof.adamski@sonymobile.com> wrote:

> It seems that on H3, just like on A10, when GPIOs are configured as
> external interrupt data registers does not contain their value.  When
> value is read, GPIO function must be temporary switched to input for
> reads.
>
> Signed-off-by: Krzysztof Adamski <k@japko.eu>

Patch applied for fixes with Maxime's ACK.

Yours,
Linus Walleij
