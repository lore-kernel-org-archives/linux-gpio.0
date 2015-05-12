From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 22/23] gpio: sysfs: remove FLAG_SYSFS_DIR
Date: Tue, 12 May 2015 10:44:30 +0200
Message-ID: <CACRpkdYXvzsowLdNfm=EVynF6AfC9wD3=bgc3T2+875ZCyG+Uw@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-23-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430752248-15401-23-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Remove FLAG_SYSFS_DIR, which is sysfs-interface specific, and store it
> in the class-device data instead.
>
> Note that the flag is only used during export.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
