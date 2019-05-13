From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 13 (drivers/pinctrl/pinctrl-stmfx)
Date: Mon, 13 May 2019 12:21:30 -0700
Message-ID: <5d6d5c73-2af9-2455-d3d8-3c731019f578@infradead.org>
References: <20190513142525.43c0e826@canb.auug.org.au>
 <9bfd6a01-1b08-a21b-64fe-ccbe6d5e2810@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9bfd6a01-1b08-a21b-64fe-ccbe6d5e2810@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amelie Delaunay <amelie.delaunay@st.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 5/13/19 8:06 AM, Randy Dunlap wrote:
> On 5/12/19 9:25 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any v5.3 material to your linux-next included
>> trees/branches until after v5.2-rc1 has been released.
>>
>> Changes since 20190510:
>>
> 
> on x86_64:
> # CONFIG_OF is not set
but CONFIG_COMPILE_TEST=y

> 
> ../drivers/pinctrl/pinctrl-stmfx.c:410:20: error: ‘pinconf_generic_dt_node_to_map_pin’ undeclared here (not in a function)
>   .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
>                     ^
> ../drivers/pinctrl/pinctrl-stmfx.c: In function ‘stmfx_pinctrl_probe’:
> ../drivers/pinctrl/pinctrl-stmfx.c:652:17: error: ‘struct gpio_chip’ has no member named ‘of_node’
>   pctl->gpio_chip.of_node = np;
>                  ^
> 
> 
> Full randconfig file is attached.
> 
> 


-- 
~Randy
