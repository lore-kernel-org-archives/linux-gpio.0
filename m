From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/3] gpio: sysfs: fix gpio-chip device-attribute leak
Date: Sun, 25 Jan 2015 18:25:32 +0900
Message-ID: <CAAVeFuJEVB2NYCEcRrS8oMjhYpon0kp_2nQ9DB5Cp3n1C4tLAA@mail.gmail.com>
References: <1421150406-20255-1-git-send-email-johan@kernel.org> <1421150406-20255-2-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421150406-20255-2-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 13, 2015 at 9:00 PM, Johan Hovold <johan@kernel.org> wrote:
> The gpio-chip device attributes were never destroyed when the device was
> removed.
>
> Fix by using device_create_with_groups() to create the device attributes
> of the chip class device.
>
> Note that this also fixes the attribute-creation race with userspace.

... and it also improves code readability.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
