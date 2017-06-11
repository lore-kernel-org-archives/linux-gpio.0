From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/3] gpio: Add support for TPS68470 GPIOs
Date: Sun, 11 Jun 2017 16:43:55 +0300
Message-ID: <CAHp75Ve5zabpmRoAYbg7ONcp8WM_cCB=xiSLhSnU6QzC0CnJ3g@mail.gmail.com>
References: <1497161395-36504-1-git-send-email-rajmohan.mani@intel.com> <1497161395-36504-3-git-send-email-rajmohan.mani@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1497161395-36504-3-git-send-email-rajmohan.mani@intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Rajmohan Mani <rajmohan.mani@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jun 11, 2017 at 9:09 AM, Rajmohan Mani <rajmohan.mani@intel.com> wrote:
> This patch adds support for TPS68470 GPIOs.
> There are 7 GPIOs and a few sensor related GPIOs.
> These GPIOs can be requested and configured as
> appropriate.

Main points (some I already told in an answer to Sakari's mail):
1. Consider 2 GPIO chips over 1.
2. Fix FIXME(s).
3. If there is hardware bug we should work around it must be clarified.
4. You missed Linus' comments here (switch to the data pointer inside
GPIO chip and remove platform driver data stuff from the driver).

-- 
With Best Regards,
Andy Shevchenko
