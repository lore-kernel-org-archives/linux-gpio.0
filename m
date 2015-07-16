From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2] gpio/davinci: add interrupt support for GPIOs 16-31
Date: Thu, 16 Jul 2015 14:34:54 +0530
Message-ID: <55A773B6.7030906@ti.com>
References: <1435861890-23147-1-git-send-email-vitalya@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435861890-23147-1-git-send-email-vitalya@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vitaly Andrianov <vitalya@ti.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, linus.walleij@linaro.org, grygorii.strashko@ti.com, m-karicheri2@ti.com
List-Id: linux-gpio@vger.kernel.org

On Friday 03 July 2015 12:01 AM, Vitaly Andrianov wrote:
> Interrupts for GPIOs 16 through 31 are enabled by bit 1 in the
> "binten" register (offset 8). Previous versions of GPIO only
> used bit 0, which enables GPIO 0-15 interrupts.
> 
> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
