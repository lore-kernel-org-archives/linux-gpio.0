From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH] gpiolib: Provide and export gpiod_export_name
Date: Mon, 11 Aug 2014 09:13:49 -0700
Message-ID: <53E8EBBD.6080500@roeck-us.net>
References: <1406139132-5404-1-git-send-email-linux@roeck-us.net> <CAAVeFuKsJpSYo2DMyTdYE2J5Cu_ZD=b9o-=S0DLDccyNmwniNg@mail.gmail.com> <53D0A8B7.2010005@roeck-us.net> <CAAVeFuK5uKhpkpEnoRFGKU4G4Fey0+giz5wwmtr+OCLJHPvnLQ@mail.gmail.com> <53E32C09.5000704@roeck-us.net> <CAAVeFuJohBznnjELvJj0OUCK+anbZ-j1xPc9gyKDGVq9X0MDSA@mail.gmail.com> <53E8DE1D.9070503@roeck-us.net> <CAAVeFuK8kb3kopVaM9qz+qOa4RT_oji8LNLQa_UHDxxxwyfZgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuK8kb3kopVaM9qz+qOa4RT_oji8LNLQa_UHDxxxwyfZgw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>
List-Id: linux-gpio@vger.kernel.org

On 08/11/2014 08:20 AM, Alexandre Courbot wrote:
[ ... ]
>
> Note that this doesn't change anything to the core of the argument ;
> we have not heard what Linus thinks about named GPIOs in
> /sys/class/gpio yet, maybe he will have a different opinion...
>

Well, please let me know if/when you are planning to take away
that existing ABI so I can plan accordingly. FWIW, out-of-kernel
users I am currently aware of are Juniper Networks and Zodiac
Aerospace. The latter asked me to help them upstreaming their code.

If you plan to remove the ABI, you might want to inform its current
in-kernel users. You can look those up yourself.

Thanks,
Guenter

