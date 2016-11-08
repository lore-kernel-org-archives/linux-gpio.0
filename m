From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] gpio: davinci: Use unique labels for each gpio chip
Date: Tue, 08 Nov 2016 10:16:13 -0800
Message-ID: <m2oa1p6dn6.fsf@baylibre.com>
References: <20161103113410.2163-1-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161103113410.2163-1-ahaslam@baylibre.com> (Axel Haslam's
        message of "Thu, 3 Nov 2016 12:34:10 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Haslam <ahaslam@baylibre.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, nsekhar@ti.com, david@lechnology.com, grygorii.strashko@ti.com, keerthy@ti.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Axel Haslam <ahaslam@baylibre.com> writes:

> The gpiod framework uses the chip label to match a specific chip.
> The davinci gpio driver, creates several chips using always the same
> label, which is not compatible with gpiod.
>
> To allow platform data to declare gpio lookup tables, and for drivers
> to use the gpiod framework, allocate unique label per registered chip.
>
> Signed-off-by: Axel Haslam <ahaslam@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>
