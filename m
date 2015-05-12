From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 15/23] gpio: sysfs: only call irq helper if needed
Date: Tue, 12 May 2015 10:35:53 +0200
Message-ID: <CACRpkdbCFd9LqL6hbTRsKOFTnr0cyH+z+5iNO5EcMjZdEp3uew@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-16-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430752248-15401-16-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Only call irq helper if actually reconfiguring interrupt state.
>
> This is a preparatory step in introducing separate gpio-irq request and
> free functions.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
