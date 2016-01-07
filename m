From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH -next] gpio: xilinx: Do not use gpiochip_get_data() in
 xgpio_save_regs()
Date: Thu, 7 Jan 2016 06:49:12 -0800
Message-ID: <568E7AE8.3060207@roeck-us.net>
References: <1452126010-1111-1-git-send-email-linux@roeck-us.net>
 <CACRpkdYG77Q30J4hodKEqR2Cth==XfyqU5wi5gk3wz+YS6qJ8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYG77Q30J4hodKEqR2Cth==XfyqU5wi5gk3wz+YS6qJ8g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 01/07/2016 01:07 AM, Linus Walleij wrote:
> On Thu, Jan 7, 2016 at 1:20 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>
>> Commit 097d88e94c44 ("gpio: xilinx: use gpiochip data pointer") replaces
>> the use of container_of() with gpiochip_get_data(). Unfortunately, the
>> data pointer is not yet set by the time xgpio_save_regs() is called,
>> causing a system hang.
>>
>> Fixes: 097d88e94c44 ("gpio: xilinx: use gpiochip data pointer")
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> It might make sense to merge this patch with the patch introducing the problem.
>
> Patch applied, thanks for finding and fixing this so quick!
>
Code inspection shows that there are two more - I'll send patches today.

Guenter
