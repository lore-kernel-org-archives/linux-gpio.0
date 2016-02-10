From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: davinci: Fix the number of controllers allocated
Date: Wed, 10 Feb 2016 11:01:59 +0100
Message-ID: <CACRpkdadwVGkDmeo9Z_F3rCfjoH7BBYwL5zPkhHipjxLTR5ong@mail.gmail.com>
References: <1453988331-17111-1-git-send-email-j-keerthy@ti.com>
	<1453988331-17111-3-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453988331-17111-3-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 28, 2016 at 2:38 PM, Keerthy <j-keerthy@ti.com> wrote:

> From: Lokesh Vutla <lokeshvutla@ti.com>
>
> Driver only needs to allocate for [ngpio / 32] controllers,
> as each controller handles 32 gpios. But the current driver
> allocates for ngpio of which the extra allocated are unused.
> Fix it be registering only the required number of controllers.
>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Patch applied for fixes with Grygorii's review tag.

Yours,
Linus Walleij
