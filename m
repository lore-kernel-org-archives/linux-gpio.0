From: Randy Dunlab <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 13 (pinctrl/axp209)
Date: Wed, 13 Dec 2017 10:10:51 -0800
Message-ID: <15215929-eba3-d958-46f1-3bc7e6b97c7a@infradead.org>
References: <20171213163356.0a5e25ba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20171213163356.0a5e25ba@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Quentin Schulz <quentin.schulz@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 12/12/2017 09:33 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20171212:
> 

on x86_64:

when CONFIG_OF is not enabled:

../drivers/pinctrl/pinctrl-axp209.c:312:21: error: 'pinconf_generic_dt_node_to_map_group' undeclared here (not in a function)
  .dt_node_to_map  = pinconf_generic_dt_node_to_map_group,

../drivers/pinctrl/pinctrl-axp209.c:313:18: error: 'pinconf_generic_dt_free_map' undeclared here (not in a function)
  .dt_free_map  = pinconf_generic_dt_free_map,


-- 
~Randy
