Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178831;
	b=tXXRLYlYqb1uwfdx+ctJZTfRQ4KZ4cWCsOPlglCbuyFYDNOMc6hGvU7rBLqoRCdyUAJL
	 DkiPamo7pd7SCsihzEJiukVfKm15WVwWEXxsp8kq8Byz86bZRGewgB3PAhv36rs3d8XeN
	 pzB9WTKJFfSWTYLN6qR+XaV8zcqqoKDUmmWIu8uaXQw+Kh5SUkZxibLbuKV/o01lVCv2P
	 vOaLrpArAjIB7lqE3I1Le6VG8AETMI63xdrkiyFYDf2gzWoZJ1egnK1r4V39mZVEzIC+X
	 P9xtaBj2SJZTgy7GrBKg10aMSpqUrg5G1xujjS0MyjMO2+8Goj715MF/aBT+kR2kNeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
	b=AqLIcklHeutwJoSVIb7KX0GgzCOtZ9TO+LjVuO/ICnIfT9T3kAdu+IPmPn2M8zhXsnX4
	 H4IhqwaPFjsaLXmL8qe7RGQGsrRj5IW/Y9shIbI0j2PvpzCSs4ZaJwOcbmx/5WySx7ngJ
	 v4RZqTDX0RM8i6t6r4HhtcooZdvAYwPnwM+yx5dOuIXhjJzLZH+JQoQ4ZRYxiwHBjlEQz
	 JDeIcWL7Nlx4jNv8r9b36iK9FdVKAlRNr03HXAItFbC1ibQfazRX0GU3Xuil4K+h9dps1
	 BANmfergDybf9yDMevGa9zxh7d08N4AYujWvbdgXvP/SoF/SvyYOMrOFHs2R0THYw7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kAGwoYqj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jO1qHF7P;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF7B60A3822
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DF7B60A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kAGwoYqj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jO1qHF7P
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjwMB1528606
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=; b=kAGwoYqjsmEOPEvP
	RG+KpqsE5zTdml35zlezIrOW9bKHXwW2kZmk6LInh59yRJVcubAJlwRE6yz1eQp4
	tlIpsbo0fM3C7HjmfNcN1gBnKO3TCQy0Zdn3vKhEt4+cXYIbrcCxc6DwuwMoLVUc
	35bGjsWoQRFJrZB+tzVKEzXnTnraP6EJ2tllQ2IyYqwCYKLpvfk236uFKkFkjcnm
	gRjtbZCM/qHwJ86d8OXDIBHXk8l5Ww2xRQeE6mRLm4x1d0k+DYqbz+phvoRNdxEH
	QIHP66dFfcFigzkpoAy5Xcqap7Ybg5UqUEa7ZXXl8pZg9NjSzhXZFzRV4HUitGzv
	6J335g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtsvv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:47:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so232933085a.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 04:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178828; x=1795783628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=jO1qHF7P7o4akl0RUuE/spzdPombuX15HfrCKCXmhjHdxo6PHCl0R2iYKQ29vCfHis
         Ry7fhXkc1LhwoxhTjXYKvXBpgXQNFKeESEw9q1tWi3W4Z9beUbjpd3md3S+P8i7quMNy
         8jtjYt2kzrCEMR38rxCZF3wUNxUo8YLtb/y5QrflZFAzgS6QIIKkC8ULTjlOAy/vAAHM
         NJDi6UGRSd/5C+TX2VXRycFoU0jQ1iwTtoCrFN5DlSNHZJaFsPc3aSpwZoJ03gNgCHHB
         uTd04ayi4x8sTzEuigLJqjD7majhDCOekkSuwjK8a/egOGUj9uafhBr5oqoRjAzDmX8a
         K+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178828; x=1795783628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=1o82c5xlCavN7OuTWkGWZgW0j/mCPqQ9kPA1pa2FjhDY0yFHXl0+ig26Sfl84VKAib
         8m98WiOOkDGC8j+S9uCI4UXz7Gu4ma3c7nG6V4xmB9cBMgHPi9XfiU1QEKq9UGUm2HHZ
         TezRXf+AkmUxpCDvx4907dN7PEEhrPMdVvwLTvgcUG0XWt/xNuJGMHsg4G5w6AnS1/Kp
         ALAvFLphMhS1vmk9IbOB2517dTLYRZMjyZYtoVRAbzgA+0dsI514el0FmmYQeAUvLuT9
         CG0LaAZ13J6/+R2uCbwAEJaLUOB4Fg8a5EunBv08y2p5AMhMHRD9fOCWccNSxAg4ZKLj
         VTpg==
X-Forwarded-Encrypted: i=1; AL+hErHc3bEwqpoltaQSJ8NvChsW+n6fQ7duoSv75+LeW1FSsmhRAG1p6SsSNTzoGzJI0N1XgKhp7+wUYZKY@vger.kernel.org
X-Gm-Message-State: APuU4Z/rg3BdjaUjaRj5JMePiTSdFTetUJlF+GN7YfBnJW2WyK9ynb+K
	RE/nXhts3YInEVVevbZ+bHcDKgLUbp3lBGEQGlBudYh5tVPtcm6oYpaE4MlxKGOybdjxzTjH1aL
	78Y1otQIdQ9gnVTUHxag6K2+CvLIj4v4DQ+MkNvSRcOj9/PdIRxHh4FdunHRMIejE
X-Gm-Gg: AYBFou1HZJ5FHoWK92G3XbWaYBPxJMKYNvqwfqtHWb9iT/5Ps8lmeQ3yJ/cpVLwJAV0
	FRP7mSbv0f2+YMBWf4vp4/FHAYuu6X06J0a6v3GuKgpWeFHaqBpxqkZeYYmV7qT2j1+4rbt5Uym
	+pvpFF7wuqc3idIg+yFPBsvOEp3cDCY4G06wTtYXOL+IhZ9E498XKCwCAVBGgLikmapt+NrTtjG
	LmPWv8tMy5lnaTkDv3hWSVmSPE8oJSje0DXxvcB+RAUQxZVSZopzoKuhnbRNh8XWTAo6wlB7BO/
	r9aBgXRrykDpLE55Wc2W0VXOB6yNBh4PqBa0iNvzI91H5FKW0Shy+LBvibAoeqzP0RVPs6RU2yQ
	Xqco0jQc4/b2gUM2PnkFlgDlKXHcdGQjuCYeHwCgIAc7fmq7zDGgYeMBWGf/bL143i+EG/fb4gZ
	g=
X-Received: by 2002:a05:620a:4453:b0:93e:c12c:fbba with SMTP id af79cd13be357-949bab47df4mr465801385a.71.1795178828488;
        Fri, 20 Nov 2026 04:47:08 -0800 (PST)
X-Received: by 2002:a05:620a:4453:b0:93e:c12c:fbba with SMTP id af79cd13be357-949bab47df4mr465795585a.71.1795178827983;
        Fri, 20 Nov 2026 04:47:07 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:47:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:43 +0100
Subject: [PATCH v3 06/10] fwnode: define the count_references() fwnode
 operation
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-fwnode-for-each-prop-v3-6-808e304dc73e@oss.qualcomm.com>
References: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
In-Reply-To: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uLLErtVyyBCCkNg/MASZUF+mZGiOHH8LUrLC/RKjXs4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE3uresk7TAtJ8rliLvhk3SedImd2uTEfvXz
 2xdszcr3XeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNwAKCRAFnS7L/zaE
 w6LmEACYmRIPS0gPFt2gflTXMQeY2t8+0rQqwmjThzMGX0djCywgpXZ3HDOGp7XitV+81T0yfY8
 iKtdUOG5Zvi5dJSBWI6R3VZIyFj/1NGOMWOCuti5JkgVqm2Tve3KQDazZJwgjZfvaPndgpbw5KP
 CxYXQ3YftxvsbooRE9DQkRSkZ056NIaRtJWUH2a2w4QVnS/Kmfk0ZD3/SmwAgaHkm79Ma3jpAWP
 Mu0Ke9tCPBAaochJ+RAJoMC9jRWd5Jkbzpa/wW2xDiTn8bK8IleJivLvnxnLFQi6jSencLgOGPp
 m7P+g02A/eeTZUsnHXUnVE5ZmOYo15yzDN60ErDsZu/98O+Ch8PeVd54PVyD3rqpbqWjiAyPAa7
 kGlp9G57fMEZv57qUFcZPAx85AYSNx0W/FmaXn/vbfvMsmIAgy9ve2HFXeywf83gr59lsdzfxu8
 ODfZeZ6XXhefRH7nQZFgHxsE5T3yEFnpqGJVJ9N2z8sIw5PQ/x1lJsIz7F8GillN3O0eqPPUroe
 fnB7/Jec2MbvozCzZXSYBdhnVzwWhxUZbsTVch1xl1gdhj6BjiECQCvPol4hby0jzwZubuJQ7E3
 21kBn2CKKGgGfGsMti+vvqoAJ/0QFEd/SnRz+B5Cyvo8Bp6LC4+35IOtDzTHSCVaJohD9Zji5bl
 8quoz9OFXG2XsSw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: eoaAJnoZlkvknkNV9sCUdIYCF1KkmIZ-
X-Proofpoint-GUID: eoaAJnoZlkvknkNV9sCUdIYCF1KkmIZ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX4fg+j3MA9sBp
 LwMIag8+oEgD0PtSXSS21v4AMCF2zpmpD0TJmpgmsdCKOgYASLjUDyM/3Yku0GuSgioJjDEGPHc
 9cPIQAhwMRQcHvBpVzx+yPfQwv4mKCKUjyLsWkL9bZ5Kn0Qc5ss197brNNps8eJf3kxCphVq9IN
 jgQX8ZbROhg3S1TeWc+vGzQOke7HvRY3oj/dUlLMfbbz/cZQCOh2HlMuHPTL7J3kE/CUcoud08d
 BjMZSGwBEf12Hl4fEkT6XHJ3NFhSIOXi31hlc7ifbGKs9R87Bjfse+b0nmln8UiJL12d1YX1G3r
 03e2IZ6k3CJi/PLSNnmW7U2Cgc55k3709sKq60ZFZIHIEjfrxfQgor4QckKqLm1tdY5kcp2VxiI
 TQwq5UcQgBNGExOQSnr60whUiPw0MQKDQHOrmuIHgKrXtq6HURDGP0T0OmEBhpuYae7wbLFiJLD
 z3LL+JuXu0BoEuj5kVg==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b00414d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pu8Hlg4PHyDR7New1bsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX1jA6yQdBGN+2
 5Am/TzUflUV3tiWiQ+x61BoQl1iq59HTI6kdmXAxmaSJwxiLNTxU+iYw7Ja9oFkPPYSnmFuU1Ey
 iEbomlZKMEl8kGXybbBMwyc1NsLKrPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

Add a new fwnode callback allowing to count all references of given
firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/fwnode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 2d7e0b9245d445d473c7317bd27058abe5750b40..15acade60564ddb5f5a48f2235b626466d77dbdf 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -137,6 +137,10 @@ struct fwnode_reference_args {
  * @get_parent: Return the parent of an fwnode.
  * @get_next_child_node: Return the next child node in an iteration.
  * @get_named_child_node: Return a child node with a given name.
+ * @count_references: Return the number of references in a property, including
+ *		      empty ones. @nargs_prop names the property in the
+ *		      referenced node holding the number of arguments, if NULL
+ *		      the references have no arguments.
  * @get_reference_args: Return a reference pointed to by a property, with args
  * @graph_get_next_endpoint: Return an endpoint node in an iteration.
  * @graph_get_remote_endpoint: Return the remote endpoint node of a local
@@ -180,6 +184,8 @@ struct fwnode_operations {
 	struct fwnode_handle *
 	(*get_named_child_node)(const struct fwnode_handle *fwnode,
 				const char *name);
+	int (*count_references)(const struct fwnode_handle *fwnode,
+				const char *prop, const char *nargs_prop);
 	int (*get_reference_args)(const struct fwnode_handle *fwnode,
 				  const char *prop, const char *nargs_prop,
 				  unsigned int nargs, unsigned int index,

-- 
2.47.3

