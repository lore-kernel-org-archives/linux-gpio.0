From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 11/23] gpio: sysfs: remove redundant export tests
Date: Tue, 12 May 2015 10:30:24 +0200
Message-ID: <CACRpkdYWZftkONEFucAkzkTZ-zn1PXWUcx8u3jkp9uiMbJMXWQ@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-12-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430752248-15401-12-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> The attribute operations will never be called for an unregistered device
> so remove redundant checks for FLAG_EXPORT.
>
> Note that kernfs will also guarantee that any active sysfs operation has
> finished before the attribute is removed during deregistration.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
