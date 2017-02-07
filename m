From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
Date: Tue, 7 Feb 2017 11:27:17 +0100
Message-ID: <064eba3d-40a3-5def-0947-7c57c11517d8@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
 <2041391.79UjQ7DgUt@avalon> <83c749f8-4eee-96e7-9c91-8a350d2a7498@jmondi.org>
 <20170206182813.GI3897@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170206182813.GI3897@atomide.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linus.walleij@linaro.org, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Tony,

On 06/02/2017 19:28, Tony Lindgren wrote:
> * jacopo mondi <jacopo@jmondi.org> [170206 10:16]:
>> Currently there is no generic pinctrl and pinmux function to retrieve a
>> group or function by name, but only by their id (selector).
>> It would take 10minutes to add them, but I wonder if that's desirable or
>> there are other ways to do so I haven't found out yet.
>>
>> Linus, Tony and gpio people: do you have opinions on this? I can add those
>> functions to core/pinmux in my next patch series if I get your ack here.
>
> I would just get rid of the names and allow optionally configuring them
> from the consumer. Just like we do for interrupts and GPIOs.
>

Mostly, I wonder why so far nobody had to remove function and groups and 
release their associated data when deleting a map. It makes me think 
this is not required or I didn't fully get dt_free_map() purpose :/
Or, put it in another way, I see lot of code releasing memory associated 
with PIN_MAP_TYPE_CONFIGS_GROUP map types (as map.data.configs.configs 
it's easy accessible), but none releasing data associated to 
PIN_MAP_TYPE_MUX_GROUP map types...

Thanks
    j


> Regards,
>
> Tony
>
