From: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH v3 3/3] gpiolib: Show correct direction from the beginning
Date: Tue, 2 Oct 2018 07:29:48 -0500
Message-ID: <b3b2e31d-f411-370d-21c9-3a141906ee58@kernel.org>
References: <20181002082731.20141-1-ricardo.ribalda@gmail.com>
 <20181002082731.20141-3-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002082731.20141-3-ricardo.ribalda@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, swboyd@chromium.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

On 10/2/18 3:27 AM, Ricardo Ribalda Delgado wrote:
> +		/* REVISIT: most hardware initializes GPIOs as inputs (often
> +		 * with pullups enabled) so power usage is minimized. Linux
> +		 * code should set the gpio direction first thing; but until
> +		 * it does, and in case chip->get_direction is not set, we may
> +		 * expose the wrong direction in sysfs.
> +		 */

I don't think this comment applies any more.

Also, please don't use timur@codeaurora.org any more.  That address is 
no longer valid.  Use timur@kernel.org instead.
