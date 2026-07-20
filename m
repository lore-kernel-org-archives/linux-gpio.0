Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62B335AC18;
	Mon, 20 Jul 2026 13:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552774; cv=none; b=gSFIyvOBkNkx+ivtxmSf8FOJPobc8DG/1y4yaKu9W4wmfOAFKkTL1oeLQmdiBbYjDQQKtBwfaAyaF5HYVc0g698PYMwwg2/nViu0lUIUZ1LntGaIBuIBdt8YGB3lHOvRlpEMZThaknNsYEI/wAjg8G0nhf3CUA8IQl66RXp2xpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552774; c=relaxed/simple;
	bh=rbHdrfeUxwIWt74WfrvjnGN8MKnxKio593ckSHugsMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k75npOS2/aWRdX4XmRdpOkWKEDzTpgHaOR7QQV8K+qYo7f8FxmHLDtQfjK4sPd37CpoQETms48YFO3gWp6ugJWRjSdSmEgfMePzXXqo279TssBHfJU/uUZ/kHBQBI8/Qjc4wZlU4g6P2SM7Ih6xRl9FRaorMyANTDWmGRyv2fUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKoz0K0k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKoz0K0k"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAw3K42377694;
	Mon, 20 Jul 2026 13:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VQDCv8DYN8s
	ULm3XwGhBEyV+jZAq4HawEsxAhP0TGJI=; b=bKoz0K0kVk8wD5yaV2oJiIrqIft
	BSidE58AdLOFDizN6kO1RpqkojFatHOpwqkFG9n5j7ulcPZvtqMcXOpYoI18zFx7
	JOV9mp+ouBb9K3zG3mhbePiKzTq6C/2uunfEgqXvwzd+trhd5QgfSUXBENnf6r7q
	KBBZytTJyd7X/Tat+TMaYE5jLSyHDQwRQniBH6tYdsN0fnvL3qcQZpfTrn8q4st0
	TaUhY8m3y8dxuizCOvTn4vnCbwLpRNxmkgrGDUD+YWepwlUgKgJq8guTyoPTkuEs
	pCQadrKJr7Pdo/Pi/Q+ppzDbrn3YsRGcFRMwWpWyML4nZRrYR5sohxeMPlQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre90tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 13:06:01 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66KD5vwv002677;
	Mon, 20 Jul 2026 13:05:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fgj3vh9mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 13:05:58 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66KD5vkW002654;
	Mon, 20 Jul 2026 13:05:57 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66KD5vXe002648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 13:05:57 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 47EEB636; Mon, 20 Jul 2026 18:35:56 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v4 2/4] ASoC: qcom: q6prm: add support for LPASS LPR resource voting
Date: Mon, 20 Jul 2026 18:35:09 +0530
Message-Id: <20260720130511.493295-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfX8hoivf2ugoXB
 yqaxAuNiPKQe0zSN32bid/NWP2eVugYlJE9i1Nrl6qLKN5XXO/4tZ8SpNymWXpBKJ9l9EQVlYgi
 hvsg6Yp7tpydBPFGpYDllQxot9IwysQ=
X-Proofpoint-GUID: j9hXsdb_YtZi8yOgUiexc5WnORN0gpz-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfX/MyEjPbcNfdm
 /wrY1uTtFnHFN0eCAtDUnlpWIEnLr8ClHz5dML4rg7fJTiNroK0Y22BpykGcsHp3WRH8rL+1F3b
 NNlhL1axKcON3RQ7jG+oYPUghFvgXrVRpWraWVMp4BmFSqV7B+rBDhKTA8kR2GfgAybxVeo/zet
 stm4weSH7ehHDSu/1yVp1SjjQ/lYJ3bHhwpZ1xq0lXy+im3M3VqOnw7Y7S8LaiDbCZHjIwd+q2y
 HWlV2gV7UOcdMuz6ub6heioMVnkkWGZSYkhhyI1PgrBc1HTdwnSOl5jUWGYzg8jjGZEa+tAS3wB
 7mnLLUT/rk/qdrAN3afFdyajB76tyJlsCS+BpJ1hGXOAX3vDAFm9dOgcYVtAudYidHae6S5nfR3
 1exWQyyMHS/WVem7w4ud8yFtdj/JWdx5ruJzJtFDbgKrPCz2cENHjeaza4W7QNVgCUBlTmYwz//
 2yoLIqnqoDuAmR5E6zQ==
X-Proofpoint-ORIG-GUID: j9hXsdb_YtZi8yOgUiexc5WnORN0gpz-
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5e1d39 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=AiEp7IXl2_k0sn4W3poA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200144

Add support for issuing LPASS low-power resource (LPR) votes through
the PRM interface.

Some platforms (e.g. Hawi) require the LPASS to be kept active via LPR
resource voting instead of the existing hardware core vote mechanism.
Handle this by introducing support for PARAM_ID_RSC_CPU_LPR when the
LPR vote clock ID is requested.

For LPR requests, use the appropriate parameter ID and payload format
to disable CPU subsystem sleep, ensuring that the LPASS register space
remains accessible.

Also add the corresponding clock mapping for LPASS_HW_LPR_VOTE and
update Q6DSP_MAX_CLK_ID to 105 to keep the q6dsp clock ID range
consistent with the dt-bindings.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c |  2 +-
 sound/soc/qcom/qdsp6/q6prm-clocks.c       |  2 ++
 sound/soc/qcom/qdsp6/q6prm.c              | 16 +++++++++++++---
 sound/soc/qcom/qdsp6/q6prm.h              |  1 +
 4 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
index 03838582a..ab7d20580 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
@@ -12,7 +12,7 @@
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "q6dsp-lpass-clocks.h"
 
-#define Q6DSP_MAX_CLK_ID			104
+#define Q6DSP_MAX_CLK_ID			105
 #define Q6DSP_LPASS_CLK_ROOT_DEFAULT		0
 
 
diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index 4c574b48a..2b2b3872e 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -63,6 +63,8 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 		       "LPASS_HW_MACRO"),
 	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
 		       "LPASS_HW_DCODEC"),
+	Q6DSP_VOTE_CLK(LPASS_HW_LPR_VOTE, Q6PRM_HW_LPR_VOTE,
+		       "LPASS_HW_LPR_VOTE"),
 };
 
 static const struct q6dsp_clk_desc q6dsp_clk_q6prm __maybe_unused = {
diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index 04892fb44..1f3ce4cc0 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -31,10 +31,16 @@ struct q6prm {
 #define PARAM_ID_RSC_HW_CORE		0x08001032
 #define PARAM_ID_RSC_LPASS_CORE		0x0800102B
 #define PARAM_ID_RSC_AUDIO_HW_CLK	0x0800102C
+#define PARAM_ID_RSC_CPU_LPR		0x08001A6E
+
+#define LPR_CPU_SS_SLEEP_DISABLE	0x1
 
 struct prm_cmd_request_hw_core {
 	struct apm_module_param_data param_data;
-	uint32_t hw_clk_id;
+	union {
+		u32 hw_clk_id;
+		u32 lpr_state;
+	};
 } __packed;
 
 struct prm_cmd_request_rsc {
@@ -62,6 +68,7 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
 	struct prm_cmd_request_hw_core *req;
 	gpr_device_t *gdev = prm->gdev;
 	uint32_t opcode, rsp_opcode;
+	bool lpr_req = (hw_block_id == Q6PRM_HW_LPR_VOTE);
 
 	if (enable) {
 		opcode = PRM_CMD_REQUEST_HW_RSC;
@@ -82,10 +89,13 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
 
 	param_data->module_instance_id = GPR_PRM_MODULE_IID;
 	param_data->error_code = 0;
-	param_data->param_id = PARAM_ID_RSC_HW_CORE;
+	param_data->param_id = lpr_req ? PARAM_ID_RSC_CPU_LPR : PARAM_ID_RSC_HW_CORE;
 	param_data->param_size = sizeof(*req) - APM_MODULE_PARAM_DATA_SIZE;
 
-	req->hw_clk_id = hw_block_id;
+	if (lpr_req)
+		req->lpr_state = LPR_CPU_SS_SLEEP_DISABLE;
+	else
+		req->hw_clk_id = hw_block_id;
 
 	return q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
 }
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index a988a3208..bd5ee0c40 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -87,6 +87,7 @@
 #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
 #define Q6PRM_HW_CORE_ID_LPASS		1
 #define Q6PRM_HW_CORE_ID_DCODEC		2
+#define Q6PRM_HW_LPR_VOTE		3
 
 int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr,
 			  int clk_root, unsigned int freq);
-- 
2.34.1

