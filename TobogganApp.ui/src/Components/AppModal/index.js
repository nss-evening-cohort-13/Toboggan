import React, { useState } from 'react';
import {
  Button,
  Modal,
  ModalHeader,
  ModalBody,
  ModalFooter,
} from 'reactstrap';

export default function AppModal(props) {
  const {
    buttonLabel,
    className,
    title,
    btnColor,
    className2,
  } = props;

  const [modal, setModal] = useState(false);

  const toggle = () => setModal(!modal);

  return (
    <div>
      <Button
        className={className2}
        color={btnColor}
        onClick={() => {
          toggle();
        }}
      >
        {buttonLabel}
      </Button>
      <Modal isOpen={modal} toggle={toggle} className={className}>
        <ModalHeader toggle={toggle}>{title}</ModalHeader>
        <ModalBody>
          {React.cloneElement(props.children, { toggle })}
          </ModalBody>
        <ModalFooter>
          <Button className='board-buttons' color='secondary' onClick={toggle}>
            Cancel
          </Button>
        </ModalFooter>
      </Modal>
    </div>
  );
}
