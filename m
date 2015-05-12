From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: mxs: Constify platform_device_id
Date: Tue, 12 May 2015 09:40:45 +0200
Message-ID: <CACRpkdZf3Nvt74HtG_mP52mQ9mSYi0CsU9bjQdVNx=cCoNxpkA@mail.gmail.com>
References: <1430495809-32061-1-git-send-email-k.kozlowski.k@gmail.com>
	<1430495809-32061-2-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430495809-32061-2-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 1, 2015 at 5:56 PM, Krzysztof Kozlowski
<k.kozlowski.k@gmail.com> wrote:

> The platform_device_id is not modified by the driver and core uses it as
> const.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Patch applied.

Yours,
Linus Walleij
