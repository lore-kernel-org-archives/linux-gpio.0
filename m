From: Krzysztof Adamski <k@japko.eu>
Subject: Re: [PATCH v2] pinctrl: sunxi: H3 requires irq_read_needs_mux
Date: Fri, 5 Feb 2016 14:43:18 +0100
Message-ID: <20160205134317.GE12071@box2.japko.eu>
References: <20160203075713.GA23312@box2.japko.eu>
 <CACRpkdbVtLYRku03bbnT=f7Ex1FoJqBv4Z6nY7pWkHy6wvHUfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbVtLYRku03bbnT=f7Ex1FoJqBv4Z6nY7pWkHy6wvHUfg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Jens Kuske <jenskuske@gmail.com>, Fabian Frederick <fabf@skynet.be>, Vishnu Patekar <vishnupatekar0510@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 05, 2016 at 02:39:23PM +0100, Linus Walleij wrote:
>On Wed, Feb 3, 2016 at 8:57 AM, Krzysztof Adamski <k@japko.eu> wrote:
>
>> It seems that on H3, just like on A10, when GPIOs are configured as
>> external interrupt data registers does not contain their value.  When
>> value is read, GPIO function must be temporary switched to input for
>> reads.
>>
>> Signed-off-by: Krzysztof Adamski <k@japko.eu>
>
>2. Is this a regression that need to go in to fixes?

Not sure what you mean by that. H3 support was added recently without 
this flag so it never worked properly on this SoC.  With this patch it 
does. So it's just a normal bug fix, not a regression.

Best regards,
Krzysztof Adamski
