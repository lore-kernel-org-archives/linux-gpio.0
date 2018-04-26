From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: pci-idio-16: Fix port memory offset for
 get_multiple callback
Date: Fri, 27 Apr 2018 00:55:44 +0200
Message-ID: <CACRpkdbExtqVRXd2VAhMbBj=VK5V9F-igNyYZuLQkBvGuwsaPQ@mail.gmail.com>
References: <cover.1524000042.git.vilhelm.gray@gmail.com> <8d1e6c1c2b04815928fab78e1e2984b18ae516f4.1524000042.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8d1e6c1c2b04815928fab78e1e2984b18ae516f4.1524000042.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Apr 18, 2018 at 2:53 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ioread8 function expects a memory offset argument. This patch fixes
> the ports array to provide the memory addresses of the respective device
> I/O registers.
>
> Fixes: 810ebfc5efca ("gpio: pci-idio-16: Implement get_multiple callback")
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij
