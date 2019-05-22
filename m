From: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH 0/2] Allow pinctrl framework to create links
Date: Wed, 22 May 2019 17:29:23 +0200
Message-ID: <20190522152925.12419-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, alexandre.torgue@st.com, amelie.delaunay@st.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, benjamin.gaignard@linaro.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: linux-gpio@vger.kernel.org

Some pin controllers may need to ensure suspend/resume calls ordering between
themselves and their clients.
That is the case for STMFX (an I2C GPIO expender) which need to be suspended
after all it clients to let them call pinctrl_pm_select_sleep_state() before
perform it own suspend function. It is the same problem for resume but in
reverse order.

This series allow to let pinctrl core knows if a controller would like to
create link between itself and it client by setting create_link to true.

Benjamin Gaignard (2):
  pinctrl: Allow to create link between controller and consumer
  pinctrl: stmfx: enable links creations

 drivers/pinctrl/core.c          | 11 +++++++++++
 drivers/pinctrl/pinctrl-stmfx.c |  1 +
 include/linux/pinctrl/pinctrl.h |  2 ++
 3 files changed, 14 insertions(+)

-- 
2.15.0
