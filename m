From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 09/23] gpio: sysfs: use DEVICE_ATTR macros
Date: Tue, 12 May 2015 10:28:12 +0200
Message-ID: <CACRpkdYRhxu6gUGTyuddinqZuFo6ahJvKJFUEsvpc0txqOjeYA@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-10-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430752248-15401-10-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Use DEVICE_ATTR_RO and DEVICE_ATTR_RW rather than specifying masks and
> callbacks directly.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
