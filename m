From: Arkadiusz Lis <areklis909@gmail.com>
Subject: Re: GPIO consumer interface and DT
Date: Thu, 16 Aug 2018 21:07:54 +0200
Message-ID: <20180816190754.GA4505@arek-VirtualBox>
References: <20180815221102.GA4375@arek-VirtualBox>
 <CACRpkdZ04vLKZ43TAh+OLh1hwd4tkZf9fnRf120aBBSe+-MCxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kernelnewbies-bounces@kernelnewbies.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ04vLKZ43TAh+OLh1hwd4tkZf9fnRf120aBBSe+-MCxg@mail.gmail.com>
List-Unsubscribe: <https://lists.kernelnewbies.org/mailman/options/kernelnewbies>,
 <mailto:kernelnewbies-request@kernelnewbies.org?subject=unsubscribe>
List-Archive: <http://lists.kernelnewbies.org/pipermail/kernelnewbies/>
List-Post: <mailto:kernelnewbies@kernelnewbies.org>
List-Help: <mailto:kernelnewbies-request@kernelnewbies.org?subject=help>
List-Subscribe: <https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies>,
 <mailto:kernelnewbies-request@kernelnewbies.org?subject=subscribe>
Errors-To: kernelnewbies-bounces@kernelnewbies.org
To: Linus Walleij <linus.walleij@linaro.org>, Kernelnewbies@kernelnewbies.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

> You or someone else first need to define device tree bindings
> in Documention/devicetree/bindings/usb/* somwhere, then augment
> the driver to use these bindings, including the right name for
> the GPIO line, when using the devm_gpiod_get().

OK, I will try to start a discussion about this.

> I wonder how you're testing this though.

I don't have this equipment to be honest. 
Once work is done I count on kindness of interested people who actually
have it and are able to test the patch on the target.
Is there any other way?

Thanks,
Arek
