From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] clk: let of_clk_get_parent_name() fail for invalid clock-indices
Date: Mon, 30 Nov 2015 17:46:04 +0900
Message-ID: <1448873164-22415-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Currently, of_clk_get_parent_name() returns a wrong parent clock name
when "clock-indices" property exists and the target index is not
found in the property.  In this case, NULL should be returned.

For example,

        oscillator {
                compatible = "myclocktype";
                #clock-cells = <1>;
                clock-indices = <1>, <3>;
                clock-output-names = "clka", "clkb";
        };

        consumer {
                compatible = "myclockconsumer";
                clocks = <&oscillator 0>, <&oscillator 1>;
        };

Currently, of_clk_get_parent_name(consumer_np, 0) returns "clka"
(and of_clk_get_parent_name(consumer_np, 1) also returns "clka",
this is correct).   Because the "clock-indices" in the clock parent
does not contain <0>, of_clk_get_parent_name(consumer_np, 0) should
return NULL.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Rephrase the git-log

 drivers/clk/clk.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 20d8e07..8698074 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3054,12 +3054,9 @@ EXPORT_SYMBOL_GPL(of_clk_get_parent_count);
 const char *of_clk_get_parent_name(struct device_node *np, int index)
 {
 	struct of_phandle_args clkspec;
-	struct property *prop;
 	const char *clk_name;
-	const __be32 *vp;
-	u32 pv;
-	int rc;
-	int count;
+	const __be32 *list;
+	int rc, len, i;
 	struct clk *clk;
 
 	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
@@ -3068,17 +3065,20 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 		return NULL;
 
 	index = clkspec.args_count ? clkspec.args[0] : 0;
-	count = 0;
 
 	/* if there is an indices property, use it to transfer the index
 	 * specified into an array offset for the clock-output-names property.
 	 */
-	of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
-		if (index == pv) {
-			index = count;
-			break;
-		}
-		count++;
+	list = of_get_property(clkspec.np, "clock-indices", &len);
+	if (list) {
+		len /= sizeof(*list);
+		for (i = 0; i < len; i++)
+			if (index == be32_to_cpup(list++)) {
+				index = i;
+				break;
+			}
+		if (i == len)
+			return NULL;
 	}
 
 	if (of_property_read_string_index(clkspec.np, "clock-output-names",
-- 
1.9.1

