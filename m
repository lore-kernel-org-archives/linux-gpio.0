From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: pinctrl: stm32: Implement .pin_config_dbg_show()
Date: Tue, 17 May 2016 10:31:52 +0300
Message-ID: <20160517073152.GB10872@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:23933 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752261AbcEQHcH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 May 2016 03:32:07 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: patrice.chotard@st.com
Cc: linux-gpio@vger.kernel.org

Hello Patrice Chotard,

The patch 3beed93c1617: "pinctrl: stm32: Implement
.pin_config_dbg_show()" from Apr 29, 2016, leads to the following
static checker warning:

	drivers/pinctrl/stm32/pinctrl-stm32.c:798 stm32_pconf_dbg_show()
	warn: excess argument passed to 'seq_printf'

drivers/pinctrl/stm32/pinctrl-stm32.c
   781          /* output */
   782          case 1:
   783                  drive = stm32_pconf_get_driving(bank, offset);
   784                  speed = stm32_pconf_get_speed(bank, offset);
   785                  val = stm32_pconf_output_get(bank, offset);
   786                  seq_printf(s, "- %s - %s - %s - %s %s",
   787                             val ? "high" : "low",
   788                             drive ? "open drain" : "push pull",
   789                             biasing[bias],
   790                             speeds[speed], "speed");
   791                  break;
   792  
   793          /* alternate */
   794          case 2:
   795                  drive = stm32_pconf_get_driving(bank, offset);
   796                  speed = stm32_pconf_get_speed(bank, offset);
   797                  seq_printf(s, "%d - %s -%s", alt,
   798                             drive ? "open drain" : "push pull",
   799                             biasing[bias],
   800                             speeds[speed], "speed");

Yup.  Too many arguments.  Also do you want a space between "-%s"?

   801                  break;
   802  
   803          /* analog */
   804          case 3:
   805                  break;
   806          }

regards,
dan carpenter
