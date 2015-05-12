From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 12/23] gpio: sysfs: add gpiod class-device data
Date: Tue, 12 May 2015 10:31:31 +0200
Message-ID: <CACRpkdZcY8r++Oba-Z1qUmWS=HbPDD8ysv_m_2wCmWz=8_cr6Q@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-13-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430752248-15401-13-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Add gpiod class-device data.
>
> This is a first step in getting rid of the insane gpio-descriptor flag
> overloading, backward irq-interface implementation, and course grained
> sysfs-interface locking (a single static mutex for every operation on
> all exported gpios in a system).
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
