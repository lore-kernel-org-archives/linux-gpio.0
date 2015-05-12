From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5] pinctrl: Add Pistachio SoC pin control driver
Date: Tue, 12 May 2015 13:21:43 +0200
Message-ID: <CACRpkda9gP45BUyh2bCYCvUM1MM+ZbUtbiyqsQ-ZrGde7cEGrg@mail.gmail.com>
References: <1430942343-27201-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430942343-27201-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 6, 2015 at 9:59 PM, Andrew Bresticker <abrestic@chromium.org> wrote:

> Add a driver for the pin controller present on the IMG Pistachio SoC.
> This driver provides pinmux and pinconfig operations as well as GPIO
> and IRQ chips for the GPIO banks.
>
> Signed-off-by: Damien Horsley <Damien.Horsley@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
> Signed-off-by: Kevin Cernekee <cernekee@chromium.org>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Cc: James Hartley <james.hartley@imgtec.com>
> Cc: James Hogan <james.hogan@imgtec.com>
> ---
> Changes from v4:
>  - Switched to using gpiochip_add_pin_range().
>  - Fixed up Kconfig entry.

This version applied. Awesome job with this driver, thanks!

Yours,
Linus Walleij
