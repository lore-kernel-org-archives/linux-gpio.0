From: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH 2/2] pinctrl: stmfx: enable links creations
Date: Wed, 22 May 2019 17:29:25 +0200
Message-ID: <20190522152925.12419-3-benjamin.gaignard@st.com>
References: <20190522152925.12419-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522152925.12419-1-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, alexandre.torgue@st.com, amelie.delaunay@st.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, benjamin.gaignard@linaro.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: linux-gpio@vger.kernel.org

Set create_link to inform pinctrl core that stmfx wants to create
link with its consumers.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index eba872ce4a7c..55a9f145b4d9 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -622,6 +622,7 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->pctl_desc.pins = stmfx_pins;
 	pctl->pctl_desc.npins = ARRAY_SIZE(stmfx_pins);
 	pctl->pctl_desc.owner = THIS_MODULE;
+	pctl->pctl_desc.create_link = true;
 
 	ret = devm_pinctrl_register_and_init(pctl->dev, &pctl->pctl_desc,
 					     pctl, &pctl->pctl_dev);
-- 
2.15.0
