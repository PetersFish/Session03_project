package cn.peter.ssm.pojo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Scope(value = "prototype")
public class Mail {
	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column MAIL.m_id
	 *
	 * @mbg.generated
	 */
	private Integer m_id;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column MAIL.m_target
	 *
	 * @mbg.generated
	 */
	private String m_target;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column MAIL.m_sender
	 *
	 * @mbg.generated
	 */
	private String m_sender;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column MAIL.m_copy
	 *
	 * @mbg.generated
	 */
	private String m_copy;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column MAIL.m_title
	 *
	 * @mbg.generated
	 */
	private String m_title;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column MAIL.m_file
	 *
	 * @mbg.generated
	 */
	private String m_file;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column MAIL.m_isRead
	 *
	 * @mbg.generated
	 */
	private Integer m_isRead;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column MAIL.m_isDelete
	 *
	 * @mbg.generated
	 */
	private Integer m_isDelete;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column MAIL.m_content
	 *
	 * @mbg.generated
	 */
	private String m_content;

	private String m_date;

	public String getM_date() {
		return m_date;
	}

	public void setM_date(String m_date) {
		this.m_date = m_date;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column MAIL.m_id
	 *
	 * @return the value of MAIL.m_id
	 * @mbg.generated
	 */
	public Integer getM_id() {
		return m_id;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column MAIL.m_id
	 *
	 * @param m_id the value for MAIL.m_id
	 * @mbg.generated
	 */
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column MAIL.m_target
	 *
	 * @return the value of MAIL.m_target
	 * @mbg.generated
	 */
	public String getM_target() {
		return m_target;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column MAIL.m_target
	 *
	 * @param m_target the value for MAIL.m_target
	 * @mbg.generated
	 */
	public void setM_target(String m_target) {
		this.m_target = m_target == null ? null : m_target.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column MAIL.m_sender
	 *
	 * @return the value of MAIL.m_sender
	 * @mbg.generated
	 */
	public String getM_sender() {
		return m_sender;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column MAIL.m_sender
	 *
	 * @param m_sender the value for MAIL.m_sender
	 * @mbg.generated
	 */
	public void setM_sender(String m_sender) {
		this.m_sender = m_sender == null ? null : m_sender.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column MAIL.m_copy
	 *
	 * @return the value of MAIL.m_copy
	 * @mbg.generated
	 */
	public String getM_copy() {
		return m_copy;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column MAIL.m_copy
	 *
	 * @param m_copy the value for MAIL.m_copy
	 * @mbg.generated
	 */
	public void setM_copy(String m_copy) {
		this.m_copy = m_copy == null ? null : m_copy.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column MAIL.m_title
	 *
	 * @return the value of MAIL.m_title
	 * @mbg.generated
	 */
	public String getM_title() {
		return m_title;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column MAIL.m_title
	 *
	 * @param m_title the value for MAIL.m_title
	 * @mbg.generated
	 */
	public void setM_title(String m_title) {
		this.m_title = m_title == null ? null : m_title.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column MAIL.m_file
	 *
	 * @return the value of MAIL.m_file
	 * @mbg.generated
	 */
	public String getM_file() {
		return m_file;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column MAIL.m_file
	 *
	 * @param m_file the value for MAIL.m_file
	 * @mbg.generated
	 */
	public void setM_file(String m_file) {
		this.m_file = m_file == null ? null : m_file.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column MAIL.m_isRead
	 *
	 * @return the value of MAIL.m_isRead
	 * @mbg.generated
	 */
	public Integer getM_isRead() {
		return m_isRead;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column MAIL.m_isRead
	 *
	 * @param m_isRead the value for MAIL.m_isRead
	 * @mbg.generated
	 */
	public void setM_isRead(Integer m_isRead) {
		this.m_isRead = m_isRead;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column MAIL.m_isDelete
	 *
	 * @return the value of MAIL.m_isDelete
	 * @mbg.generated
	 */
	public Integer getM_isDelete() {
		return m_isDelete;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column MAIL.m_isDelete
	 *
	 * @param m_isDelete the value for MAIL.m_isDelete
	 * @mbg.generated
	 */
	public void setM_isDelete(Integer m_isDelete) {
		this.m_isDelete = m_isDelete;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column MAIL.m_content
	 *
	 * @return the value of MAIL.m_content
	 * @mbg.generated
	 */
	public String getM_content() {
		return m_content;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column MAIL.m_content
	 *
	 * @param m_content the value for MAIL.m_content
	 * @mbg.generated
	 */
	public void setM_content(String m_content) {
		this.m_content = m_content == null ? null : m_content.trim();
	}

	@Override
	public String toString() {
		return "Mail{" +
				"m_id=" + m_id +
				", m_target='" + m_target + '\'' +
				", m_sender='" + m_sender + '\'' +
				", m_copy='" + m_copy + '\'' +
				", m_title='" + m_title + '\'' +
				", m_file='" + m_file + '\'' +
				", m_isRead=" + m_isRead +
				", m_isDelete=" + m_isDelete +
				", m_content='" + m_content + '\'' +
				'}';
	}
}