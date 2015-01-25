From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/3] gpio: sysfs: fix gpio device-attribute leak
Date: Sun, 25 Jan 2015 18:27:34 +0900
Message-ID: <CAAVeFu+-g7v670Bk5V3CKTYgjkKwgFVfKYy2ktyZ5LTGtsSvzw@mail.gmail.com>
References: <1421150406-20255-1-git-send-email-johan@kernel.org> <1421150406-20255-3-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1421150406-20255-3-git-send-email-johan@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 13, 2015 at 9:00 PM, Johan Hovold <johan@kernel.org> wrote:
> The gpio device attributes were never destroyed when the gpio was
> unexported (or on export failures).
>
> Use device_create_with_groups() to create the default device attributes
> of the gpio class device. Note that this also fixes the
> attribute-creation race with userspace for these attributes.
>
> Remove contingent attributes in export error path and on unexport.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
