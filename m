From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: davinci: Use unique labels for each gpio chip
Date: Wed, 9 Nov 2016 09:14:28 +0100
Message-ID: <CACRpkdZ6F8WPyPWH+E-nTQ=h9L0qBfwUaP9gEnqj96ESBv2URQ@mail.gmail.com>
References: <20161103113410.2163-1-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161103113410.2163-1-ahaslam@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Haslam <ahaslam@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "Nori, Sekhar" <nsekhar@ti.com>, Kevin Hilman <khilman@baylibre.com>, David Lechner <david@lechnology.com>, Grygorii Strashko <grygorii.strashko@ti.com>, keerthy@ti.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 3, 2016 at 12:34 PM, Axel Haslam <ahaslam@baylibre.com> wrote:

> The gpiod framework uses the chip label to match a specific chip.
> The davinci gpio driver, creates several chips using always the same
> label, which is not compatible with gpiod.
>
> To allow platform data to declare gpio lookup tables, and for drivers
> to use the gpiod framework, allocate unique label per registered chip.
>
> Signed-off-by: Axel Haslam <ahaslam@baylibre.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
